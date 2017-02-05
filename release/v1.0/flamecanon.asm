;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"flamecanon.c"
	list	p=16f84
	radix dec
	include "p16f84.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3ff3
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_INTCONbits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_EECON1bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_EEDATA
	extern	_EEADR
	extern	_PCLATH
	extern	_INTCON
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_EECON1
	extern	_EECON2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_configure
	global	_delay
	global	_fuel_on
	global	_fuel_off
	global	_ignition_on
	global	_ignition_off
	global	_latch_on
	global	_latch_off
	global	_read_inv_stopbutton
	global	_read_flame
	global	_delay_ms
	global	_delay_ds
	global	_delay_s
	global	_delay_relay
	global	_delay_pressure
	global	_delay_spark
	global	_delay_cooldown
	global	_main

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x000C
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_flamecanon_0	udata
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_flamecanon	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _configure
;   _delay_pressure
;   _ignition_on
;   _delay_relay
;   _delay_spark
;   _fuel_on
;   _read_flame
;   _delay_ms
;   _read_flame
;   _ignition_off
;   _delay_relay
;   _latch_on
;   _read_flame
;   _delay_ds
;   _read_flame
;   _fuel_off
;   _delay_relay
;   _delay_cooldown
;   _latch_off
;   _ignition_off
;   _read_inv_stopbutton
;   _delay_ds
;   _read_inv_stopbutton
;   _delay_ms
;   _fuel_off
;   _delay_cooldown
;   _latch_off
;   _ignition_off
;   _configure
;   _delay_pressure
;   _ignition_on
;   _delay_relay
;   _delay_spark
;   _fuel_on
;   _read_flame
;   _delay_ms
;   _read_flame
;   _ignition_off
;   _delay_relay
;   _latch_on
;   _read_flame
;   _delay_ds
;   _read_flame
;   _fuel_off
;   _delay_relay
;   _delay_cooldown
;   _latch_off
;   _ignition_off
;   _read_inv_stopbutton
;   _delay_ds
;   _read_inv_stopbutton
;   _delay_ms
;   _fuel_off
;   _delay_cooldown
;   _latch_off
;   _ignition_off
;2 compiler assigned registers:
;   r0x100A
;   r0x100B
;; Starting pCode block
S_flamecanon__main	code
_main:
; 2 exit points
;	.line	117; "flamecanon.c"	configure();
	PAGESEL	_configure
	CALL	_configure
	PAGESEL	$
;	.line	119; "flamecanon.c"	delay_pressure();
	PAGESEL	_delay_pressure
	CALL	_delay_pressure
	PAGESEL	$
;	.line	121; "flamecanon.c"	ignition_on();
	PAGESEL	_ignition_on
	CALL	_ignition_on
	PAGESEL	$
;	.line	122; "flamecanon.c"	delay_relay();
	PAGESEL	_delay_relay
	CALL	_delay_relay
	PAGESEL	$
;	.line	124; "flamecanon.c"	delay_spark();
	PAGESEL	_delay_spark
	CALL	_delay_spark
	PAGESEL	$
;	.line	126; "flamecanon.c"	fuel_on();
	PAGESEL	_fuel_on
	CALL	_fuel_on
	PAGESEL	$
_00206_DS_:
;	.line	130; "flamecanon.c"	if(read_flame()) 
	PAGESEL	_read_flame
	CALL	_read_flame
	PAGESEL	$
	MOVWF	r0x100A
	MOVF	r0x100A,W
	BTFSC	STATUS,2
	GOTO	_00206_DS_
;	.line	132; "flamecanon.c"	delay_ms(200);
	MOVLW	0xc8
	PAGESEL	_delay_ms
	CALL	_delay_ms
	PAGESEL	$
;	.line	133; "flamecanon.c"	if(read_flame()) {
	PAGESEL	_read_flame
	CALL	_read_flame
	PAGESEL	$
	MOVWF	r0x100A
	MOVF	r0x100A,W
	BTFSC	STATUS,2
	GOTO	_00206_DS_
;	.line	139; "flamecanon.c"	ignition_off();
	PAGESEL	_ignition_off
	CALL	_ignition_off
	PAGESEL	$
;	.line	140; "flamecanon.c"	delay_relay();
	PAGESEL	_delay_relay
	CALL	_delay_relay
	PAGESEL	$
;	.line	141; "flamecanon.c"	latch_on();
	PAGESEL	_latch_on
	CALL	_latch_on
	PAGESEL	$
_00226_DS_:
;	.line	145; "flamecanon.c"	DEBUG_PORT = 0;
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,2
;	.line	146; "flamecanon.c"	if(!read_flame()) 
	PAGESEL	_read_flame
	CALL	_read_flame
	PAGESEL	$
	MOVWF	r0x100A
	MOVF	r0x100A,W
	BTFSS	STATUS,2
	GOTO	_00215_DS_
;	.line	148; "flamecanon.c"	delay_ds(5);
	MOVLW	0x05
	PAGESEL	_delay_ds
	CALL	_delay_ds
	PAGESEL	$
;	.line	149; "flamecanon.c"	if(!read_flame()) 
	PAGESEL	_read_flame
	CALL	_read_flame
	PAGESEL	$
	MOVWF	r0x100A
	MOVF	r0x100A,W
	BTFSS	STATUS,2
	GOTO	_00215_DS_
;	.line	151; "flamecanon.c"	fuel_off();
	PAGESEL	_fuel_off
	CALL	_fuel_off
	PAGESEL	$
;	.line	152; "flamecanon.c"	delay_relay();
	PAGESEL	_delay_relay
	CALL	_delay_relay
	PAGESEL	$
;	.line	154; "flamecanon.c"	delay_cooldown();
	PAGESEL	_delay_cooldown
	CALL	_delay_cooldown
	PAGESEL	$
;	.line	155; "flamecanon.c"	latch_off();
	PAGESEL	_latch_off
	CALL	_latch_off
	PAGESEL	$
;	.line	156; "flamecanon.c"	ignition_off(); // failsafe
	PAGESEL	_ignition_off
	CALL	_ignition_off
	PAGESEL	$
_00210_DS_:
;	.line	157; "flamecanon.c"	while(1) { } ; 
	GOTO	_00210_DS_
_00215_DS_:
;	.line	160; "flamecanon.c"	if (!read_inv_stopbutton()) 
	PAGESEL	_read_inv_stopbutton
	CALL	_read_inv_stopbutton
	PAGESEL	$
	MOVWF	r0x100A
	MOVF	r0x100A,W
	BTFSS	STATUS,2
	GOTO	_00226_DS_
;	.line	162; "flamecanon.c"	DEBUG_PORT = 1;
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,2
;	.line	163; "flamecanon.c"	delay_ds(5);
	MOVLW	0x05
	PAGESEL	_delay_ds
	CALL	_delay_ds
	PAGESEL	$
;	.line	168; "flamecanon.c"	for (i=0; i < 200; i++) 
	CLRF	r0x100A
_00229_DS_:
;	.line	170; "flamecanon.c"	if (!read_inv_stopbutton()) {
	PAGESEL	_read_inv_stopbutton
	CALL	_read_inv_stopbutton
	PAGESEL	$
	MOVWF	r0x100B
	MOVF	r0x100B,W
	BTFSC	STATUS,2
	GOTO	_00218_DS_
;	.line	174; "flamecanon.c"	delay_ms(1);
	MOVLW	0x01
	PAGESEL	_delay_ms
	CALL	_delay_ms
	PAGESEL	$
;	.line	168; "flamecanon.c"	for (i=0; i < 200; i++) 
	INCF	r0x100A,F
;;unsigned compare: left < lit(0xC8=200), size=1
	MOVLW	0xc8
	SUBWF	r0x100A,W
	BTFSS	STATUS,0
	GOTO	_00229_DS_
;;genSkipc:3257: created from rifx:0x7ffe58cc6690
;;unsigned compare: left < lit(0xC8=200), size=1
_00218_DS_:
;	.line	176; "flamecanon.c"	if (i < 200) // end of loop not reached
	MOVLW	0xc8
	SUBWF	r0x100A,W
	BTFSC	STATUS,0
	GOTO	_00226_DS_
;;genSkipc:3257: created from rifx:0x7ffe58cc6690
;	.line	178; "flamecanon.c"	DEBUG_PORT = 1;
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,2
;	.line	179; "flamecanon.c"	fuel_off();
	PAGESEL	_fuel_off
	CALL	_fuel_off
	PAGESEL	$
;	.line	180; "flamecanon.c"	delay_cooldown();
	PAGESEL	_delay_cooldown
	CALL	_delay_cooldown
	PAGESEL	$
;	.line	181; "flamecanon.c"	latch_off();
	PAGESEL	_latch_off
	CALL	_latch_off
	PAGESEL	$
;	.line	182; "flamecanon.c"	ignition_off(); // failsafe
	PAGESEL	_ignition_off
	CALL	_ignition_off
	PAGESEL	$
_00220_DS_:
;	.line	183; "flamecanon.c"	while(1) {  };
	GOTO	_00220_DS_
;	.line	186; "flamecanon.c"	} while(true);
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_s
;   _delay_s
;; Starting pCode block
S_flamecanon__delay_cooldown	code
_delay_cooldown:
; 2 exit points
;	.line	112; "flamecanon.c"	delay_s(120); // measured 120+14sec on chrono
	MOVLW	0x78
	PAGESEL	_delay_s
	CALL	_delay_s
	PAGESEL	$
	RETURN	
; exit point of _delay_cooldown

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_s
;   _delay_s
;; Starting pCode block
S_flamecanon__delay_spark	code
_delay_spark:
; 2 exit points
;	.line	107; "flamecanon.c"	delay_s(2);
	MOVLW	0x02
	PAGESEL	_delay_s
	CALL	_delay_s
	PAGESEL	$
	RETURN	
; exit point of _delay_spark

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_s
;   _delay_s
;; Starting pCode block
S_flamecanon__delay_pressure	code
_delay_pressure:
; 2 exit points
;	.line	103; "flamecanon.c"	delay_s(3);
	MOVLW	0x03
	PAGESEL	_delay_s
	CALL	_delay_s
	PAGESEL	$
	RETURN	
; exit point of _delay_pressure

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_ds
;   _delay_ds
;; Starting pCode block
S_flamecanon__delay_relay	code
_delay_relay:
; 2 exit points
;	.line	99; "flamecanon.c"	delay_ds(3);
	MOVLW	0x03
	PAGESEL	_delay_ds
	CALL	_delay_ds
	PAGESEL	$
	RETURN	
; exit point of _delay_relay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_ds
;   _delay_ds
;2 compiler assigned registers:
;   r0x1008
;   r0x1009
;; Starting pCode block
S_flamecanon__delay_s	code
_delay_s:
; 2 exit points
;	.line	87; "flamecanon.c"	void delay_s(uint8_t seconds)
	MOVWF	r0x1008
;	.line	90; "flamecanon.c"	for (i=0; i < seconds; i++) 
	CLRF	r0x1009
_00179_DS_:
	MOVF	r0x1008,W
	SUBWF	r0x1009,W
	BTFSC	STATUS,0
	GOTO	_00181_DS_
;;genSkipc:3257: created from rifx:0x7ffe58cc6690
;	.line	92; "flamecanon.c"	delay_ds(10);
	MOVLW	0x0a
	PAGESEL	_delay_ds
	CALL	_delay_ds
	PAGESEL	$
;	.line	90; "flamecanon.c"	for (i=0; i < seconds; i++) 
	INCF	r0x1009,F
	GOTO	_00179_DS_
_00181_DS_:
	RETURN	
; exit point of _delay_s

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_ms
;   _delay_ms
;2 compiler assigned registers:
;   r0x1006
;   r0x1007
;; Starting pCode block
S_flamecanon__delay_ds	code
_delay_ds:
; 2 exit points
;	.line	78; "flamecanon.c"	void delay_ds(uint8_t deciseconds)
	MOVWF	r0x1006
;	.line	81; "flamecanon.c"	for (i=0; i < deciseconds; i++) 
	CLRF	r0x1007
_00170_DS_:
	MOVF	r0x1006,W
	SUBWF	r0x1007,W
	BTFSC	STATUS,0
	GOTO	_00172_DS_
;;genSkipc:3257: created from rifx:0x7ffe58cc6690
;	.line	83; "flamecanon.c"	delay_ms(100);
	MOVLW	0x64
	PAGESEL	_delay_ms
	CALL	_delay_ms
	PAGESEL	$
;	.line	81; "flamecanon.c"	for (i=0; i < deciseconds; i++) 
	INCF	r0x1007,F
	GOTO	_00170_DS_
_00172_DS_:
	RETURN	
; exit point of _delay_ds

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay
;   _delay
;3 compiler assigned registers:
;   r0x1004
;   r0x1005
;   STK00
;; Starting pCode block
S_flamecanon__delay_ms	code
_delay_ms:
; 2 exit points
;	.line	68; "flamecanon.c"	void delay_ms(uint8_t milliseconds)
	MOVWF	r0x1004
;	.line	72; "flamecanon.c"	for (i=0; i < milliseconds; i++) 
	CLRF	r0x1005
_00161_DS_:
	MOVF	r0x1004,W
	SUBWF	r0x1005,W
	BTFSC	STATUS,0
	GOTO	_00163_DS_
;;genSkipc:3257: created from rifx:0x7ffe58cc6690
;	.line	74; "flamecanon.c"	delay(13); 
	MOVLW	0x0d
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	72; "flamecanon.c"	for (i=0; i < milliseconds; i++) 
	INCF	r0x1005,F
	GOTO	_00161_DS_
_00163_DS_:
	RETURN	
; exit point of _delay_ms

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1000
;   r0x1001
;; Starting pCode block
S_flamecanon__read_flame	code
_read_flame:
; 2 exit points
;	.line	66; "flamecanon.c"	bool read_flame() { return !FLAME_PORT; }
	CLRF	r0x1000
	BANKSEL	_PORTAbits
	BTFSC	_PORTAbits,1
	INCF	r0x1000,F
	MOVF	r0x1000,W
	MOVLW	0x00
	BTFSC	STATUS,2
	MOVLW	0x01
;;1	MOVWF	r0x1001
	RETURN	
; exit point of _read_flame

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1000
;   r0x1001
;; Starting pCode block
S_flamecanon__read_inv_stopbutton	code
_read_inv_stopbutton:
; 2 exit points
;	.line	65; "flamecanon.c"	bool read_inv_stopbutton() { return !STOP_PORT; }
	CLRF	r0x1000
	BANKSEL	_PORTBbits
	BTFSC	_PORTBbits,0
	INCF	r0x1000,F
	MOVF	r0x1000,W
	MOVLW	0x00
	BTFSC	STATUS,2
	MOVLW	0x01
;;1	MOVWF	r0x1001
	RETURN	
; exit point of _read_inv_stopbutton

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_flamecanon__latch_off	code
_latch_off:
; 2 exit points
;	.line	64; "flamecanon.c"	void latch_off() { LATCH_PORT = 0; }
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,1
	RETURN	
; exit point of _latch_off

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_flamecanon__latch_on	code
_latch_on:
; 2 exit points
;	.line	63; "flamecanon.c"	void latch_on() { LATCH_PORT = 1; }
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,1
	RETURN	
; exit point of _latch_on

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_flamecanon__ignition_off	code
_ignition_off:
; 2 exit points
;	.line	62; "flamecanon.c"	void ignition_off() { IGNITION_PORT = 0; }
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,3
	RETURN	
; exit point of _ignition_off

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_flamecanon__ignition_on	code
_ignition_on:
; 2 exit points
;	.line	61; "flamecanon.c"	void ignition_on() { IGNITION_PORT = 1; }
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,3
	RETURN	
; exit point of _ignition_on

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_flamecanon__fuel_off	code
_fuel_off:
; 2 exit points
;	.line	60; "flamecanon.c"	void fuel_off(){ FUEL_PORT = 0; }
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,3
	RETURN	
; exit point of _fuel_off

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_flamecanon__fuel_on	code
_fuel_on:
; 2 exit points
;	.line	59; "flamecanon.c"	void fuel_on() { FUEL_PORT = 1; }
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,3
	RETURN	
; exit point of _fuel_on

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;; Starting pCode block
S_flamecanon__delay	code
_delay:
; 2 exit points
;	.line	50; "flamecanon.c"	void delay(uint16_t iterations)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	53; "flamecanon.c"	for (i = 0; i < iterations; i++) {
	CLRF	r0x1002
	CLRF	r0x1003
_00111_DS_:
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00122_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00122_DS_:
	BTFSC	STATUS,0
	GOTO	_00113_DS_
;;genSkipc:3257: created from rifx:0x7ffe58cc6690
	nop	
;	.line	53; "flamecanon.c"	for (i = 0; i < iterations; i++) {
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00111_DS_
_00113_DS_:
	RETURN	
; exit point of _delay

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_flamecanon__configure	code
_configure:
; 2 exit points
;	.line	36; "flamecanon.c"	FUEL_PORT = 0;
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,3
;	.line	37; "flamecanon.c"	IGNITION_PORT = 0;
	BCF	_PORTBbits,3
;	.line	38; "flamecanon.c"	LATCH_PORT = 0;
	BCF	_PORTBbits,1
;	.line	39; "flamecanon.c"	DEBUG_PORT = 0;
	BCF	_PORTAbits,2
;	.line	41; "flamecanon.c"	FUEL_TRIS = 0;
	BANKSEL	_TRISAbits
	BCF	_TRISAbits,3
;	.line	42; "flamecanon.c"	IGNITION_TRIS = 0;
	BCF	_TRISBbits,3
;	.line	43; "flamecanon.c"	LATCH_TRIS = 0;
	BCF	_TRISBbits,1
;	.line	45; "flamecanon.c"	FLAME_TRIS = 1;
	BSF	_TRISAbits,1
;	.line	46; "flamecanon.c"	STOP_TRIS= 1;
	BSF	_TRISBbits,0
	RETURN	
; exit point of _configure


;	code size estimation:
;	  175+   83 =   258 instructions (  682 byte)

	end
