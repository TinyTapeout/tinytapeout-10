<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
--->

## How it works

A small SPI slave device, receives 6-bit messages to display the lower 4-bits on the 7-segment display on the TinyTapeout Carrier board

## How to test
- `SCLK`, `SS` and `MOSI` is provided through the inputs `clk`, `ui[0]` and `ui[1]` respectively. 
- First two bits in 6-bit message serve as the command, and can be `01` or `10`. 
- `01` causes the decimal point (`uo[7]`) to turn on and display the next 4 bits on the 7-segment display. 
- `10` behaves exactly the same, just switches the decimal point off. 
- In case of malformed instructions (`11` or `00`), the decimal point switches on, with the rest of the display off.

## External hardware
- Carrier board Seven Segment Display
- Microcontroller to drive the SPI slave device
