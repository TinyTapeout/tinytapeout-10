<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project is a six digit clock displaying time in a hh:mm:ss format.
Two active high pushbuttons are available to increment both the hours and minutes for setting the time.
The dot between the hour and minute numbers as well as between the minute and second numbers are blinking in the interval of a second.
The outputs are active low control signals for a common anode seven segment display.
The signals are multiplexed for all six digits and PMOS or PNP transistors are intended to enable the six digits/anodes. 

## How to test

Supply a clock of 32768 Hz clock to the circuit and connect two push buttons to input pins 0 and 1, connect a 7-segment display to the eight output ports. 
The 8-bits are coded from MSB to LSB: dot, segments a, b, c, d, e, f and g.
Conncet the bidirectional ports (all configured as outputs) to the digit enable transistors. The coding for the 6-bits is as follows: 
enable hour_tens, hour_ones, minute_tens, minute_ones, second_tens, second_ones.

## External hardware

Two active high push buttons with pull down resistors,
a six digit seven segment display,
six PMOS or PNP transistors to enable the digits.
Mounted on a breadboard or a custom PCB.
