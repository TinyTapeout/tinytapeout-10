<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements a (trivially simple) music synthesizer, where "keys" are mapped to the input PMOD
bits, and the synthesizer engine generates sine waves for each note.  The sine wave generator is similar
to the one that Mike Bell created to demonstrate the audio PMOD, but implements a more efficient method
using delta steps.  The 8-bit output is passed directly to the output PMOD, and simultaneously passed
through a PWM generator (the one from Mike Bell's project) to drive the audio PMOD.  I am considering
recasting this as an analog project and adding an 8-bit RDAC, but this version is digital only.
Output of the synthesizer is monophonic.

## How to test

Preferably attach the 8 bits of the input PMOD port to a row of 8 buttons that can be played like a keyboard.
Only whole steps are represented, for one octave C to C.

## External hardware

Preferably use Mike Bell's audio PMOD on the bidirectional PMOD port.  The project uses bit 7 as a single-bit
PWM output that is used according to the instructions for the audio PMOD.
