Salamander heater controller

Warmtekanon sturing

Firmware for a replacement controller (PIC16F84)
of a broken Holtek HT48R05A OTP controller.

The PIC is shoehorned into place:  Some circuit ajustments are
necessary since the Holtek micro has different pin assignments
for Vcc/Vss/nRST, some of which conflict with GPIO ports.

The original resonator is replaced with a RC oscillator 
configuration.

Built using SDCC : pic14 3.6.0 #9615 (Linux).

Use at your own risk.
