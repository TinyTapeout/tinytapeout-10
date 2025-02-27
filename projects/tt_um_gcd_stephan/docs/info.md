<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project is a 15 bit Greatest Common Divisor module.
Hand it two integers and it will calculate the GCD and output it.

15 bits input on ui and uio, where ui[0] is lsb, and uio[6] is MSB.
So:

| MSB    |        |        |        |        |        |        |       |       |       |       |       |       |       |  LSB   |
|--------|--------|--------|--------|--------|--------|--------|-------|-------|-------|-------|-------|-------|-------|-------|
| uio[6] | uio[5] | uio[4] | uio[3] | uio[2] | uio[1] | uio[0] | ui[7] | ui[6] | ui[5] | ui[4] | ui[3] | ui[2] | ui[1] | ui[0] |

uio[7] is used as request signal to signal when first number and second number has been inputted.
Request should be hold high when second number has inputted.

uo[7] is used as acknowledge signal, signalling when first input has been received and when GCD has been calculated.

uo[0] to uo[6] will output the GCD when acknowledge is high.

| MSB   |       |       |       |       |       | LSB   |
|-------|-------|-------|-------|-------|-------|-------|
| uo[6] | uo[5] | uo[4] | uo[3] | uo[2] | uo[1] | uo[0] |

## How to test

Assign and hold an integer to the first 15 bits of ui_in and uio_in.
Set REQ high.
Wait for ACK.
Set REQ low.
Assign and hold an integer to the first 15 bits of ui_in and uio_in.
Set REQ high.
Wait for ACK.
Read out the GCD.
Release REQ to allow for a new calculation.


## External hardware

Buttons and LEDs.
