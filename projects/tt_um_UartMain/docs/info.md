<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

You send a char via a uart port (8bit data, no partity bit) and it sends an "encrypted" char back

To update the key : briefly activate a 1 signal on updateKey port, the circuit will now wait for the next input and set it as the new key once received

> the activation signal for updateKey should be held down before sending the new key otherwise the circuit will stay in the updateKey state

The default key is b10101010.

## How to test

A python file containing a code to communicate with the serial port may be transformed to work with the TT board.

## External hardware

It requires an input clock of 50Mhz

It has two inputs :
ui[0]: "updateKey"
ui[7]: "rx"

and one output
uo[0]: "tx"