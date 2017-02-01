#define NO_BIT_DEFINES
#include <pic14regs.h>
#include <stdint.h> 
#include <stdbool.h> 

#ifdef __PIC16F84_H__
// Cext=100pF, Rext=10k 756kHz +-21% + RC tolerance
__code uint16_t __at (_CONFIG) __configword = _RC_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF;
#elif defined(__PIC16F628_H__)
// Intrc = 4Mhz
__code uint16_t __at (_CONFIG1) __configword = _INTRC_OSC_NOCLKOUT & _WDT_OFF & _LVP_OFF & PWRTE_ON & _CP_OFF;
#else
#error No config present for this chip
#endif

#define FUEL_PORT PORTBbits.RB1
#define FUEL_TRIS TRISBbits.TRISB1
#define IGNITION_PORT PORTBbits.RB3
#define IGNITION_TRIS TRISBbits.TRISB3
#define LATCH_PORT PORTAbits.RA0
#define LATCH_TRIS TRISAbits.TRISA0

#define STOP_PORT PORTBbits.RB0
#define STOP_TRIS TRISBbits.TRISB0
#define FLAME_PORT PORTAbits.RA1
#define FLAME_TRIS TRISAbits.TRISA1

void configure(void)
{
    FUEL_PORT = 0;
    IGNITION_PORT = 0;
    LATCH_PORT = 0;
    
    FUEL_TRIS = 0;
    IGNITION_TRIS = 0;
    LATCH_TRIS = 0;
    FLAME_TRIS = 1;
    STOP_TRIS= 1;
}

// Uncalibrated delay, just waits a number of for-loop iterations
void delay(uint16_t iterations)
{
	uint16_t i;
	for (i = 0; i < iterations; i++) {
		// Prevent this loop from being optimized away.
		__asm nop __endasm;
	}
}

void fuel_on() { FUEL_PORT = 1; }
void fuel_off(){ FUEL_PORT = 0; }
void ignition_on() { IGNITION_PORT = 1; }
void ignition_off() { IGNITION_PORT = 0; }
void latch_on() { LATCH_PORT = 1; }
void latch_off() { LATCH_PORT = 0; }
bool read_stopbutton() { return STOP_PORT? true:false; }
bool read_flame() { return FLAME_PORT; }

void delay_ms(uint8_t milliseconds)
{
    delay(1); // FIXME stub
}
void delay_hs(uint8_t hectoseconds)
{
    uint8_t i;
    for (i=0; i < hectoseconds; i++) 
    {
	delay_ms(100);
    }
}

void delay_s(uint8_t seconds)
{
    uint8_t i;
    for (i=0; i < seconds; i++) 
    {
	delay_hs(1);
    }
}

void delay_relay(void)
{
    // avoid sudden current changes on the relay supply net
    delay_hs(50);
}
void delay_pressure(void)
{
    delay_s(3);
}
void delay_cooldown(void)
{
    delay_s(2*60);
}
void main(void)
{
    configure();
    delay_pressure();
    fuel_on();
    delay_relay();
    ignition_on();

    do {
        if(read_flame()) {
            delay_ms(200);
            if(read_flame()) {
                break;
            }
        }
    } while (true);

    ignition_off();
    delay_relay();
    latch_on();
    do {
        if(!read_flame()) {
            delay_ms(200);
            if(!read_flame()) {
                fuel_off();
                delay_relay();
                latch_off();
                ignition_off(); // failsafe
                while(1) { };
            }
        }
        if (read_stopbutton()) {
            delay_ms(200);
            if (read_stopbutton()) {
                fuel_off();
                delay_cooldown();
                latch_off();
                ignition_off(); // failsafe
                while(1) { };
            }
        }
    } while(true);
}
