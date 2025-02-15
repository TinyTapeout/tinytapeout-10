<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The setup has two inputs and a signle output. The setup consists of a NOT gate and a NAND gate, where the NOT gate is connected to the first input and feed of one pin of the NAND gate. 
The second input of the setup is connected to the second input of the NAND gate.

## How to test

Send the following signals to IN2 and IN3 to check if the proper NAND output results:
INs  Out
00    1
10    1
01    0
11    1

## External hardware

You can test the chip with with LEDs or other indicators.
