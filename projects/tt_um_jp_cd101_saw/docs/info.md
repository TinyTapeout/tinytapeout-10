<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project provides a simple digital synth.
It consists of a pulse-wave generator with programmable frequency,
ADSR amplitude modulation with adjustable ADSR parameters and
a simple one-pole IIR filter with programmable cutoff frequency.
Digital audio output is generated using a simple first-order delta-sigma modulator.
The lowpass filter for the reconstruction of this signal must be realized externally.

All parameters can be programmed using a simple SPI slave interface.
Sound generation for a note starts when asserting the trigger signal and stops when the trigger is de-asserted again.
Triggering can happen both via a dedicated input or via SPI, which enables fully customizeable operation using the SPI port.
A VST/CLAP plugin is provided to generate the SPI commands from DAWs.

This project is educational and therefore makes some decisions that might not lead to an optimal design.
For example, the structural presentation of the signal processing pipeline is directly realized in hardware.
Some parts of the design are therefore clocked with a frequency as low as the sample rate and some even lower.
This wastes a lot of possible performance, but it is easier for students to map the audio application to the circuit mentally, compared to introducing a more complex microcontroller-based system (which might be a more efficient design).
The design shows how to realize a serial-parallel multiplier, use negative edge clocking, use simple small clock dividers, use multiple clocks etc. 

More detailed information on all these topics will be provided later on.

## How to test

As the design generates a lot of data on the single serial output pin, testing generates a lot of data.
The cocotb testbench simulates and external lowpass and stores the audio data to a .s16 file which you can convert to `.wav` using ffmpeg:

```bash

```

Play the output file to assess whether the output is reasonable.

In addition, the testbench also compares to a `golden reference` output datastream, that was generated from behavioral simulation.
This test is used to determine if there are any differences for the final implemented designs.

## External hardware

* Button PMOD
* Audio PMOD
* SPI Master (No PMOD available. Use Adafruit board)

TODO: More detailed information about these things.