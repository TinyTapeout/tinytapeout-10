<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The 1st input and the 1st output is connected to an inverter. The 2nd and 3rd input and the 2nd and 3rd output is connected to an AND-gate. The 3rd and 4th inputs and the 3rd and 4th output is connected to an OR-gate. The last 2 inputs and the 2nd-last output is connected to an Earle-latch, where the last input bit is the Enable-signal.

## How to test

For the NOT-gate, AND-gate and OR-gate, test every input combination.
For the Earle latch, test if the latch can hold onto a 0, and test if the latch can hold onto a 1.

## External hardware

No addons.
