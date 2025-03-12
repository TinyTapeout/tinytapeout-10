<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->
## How it works

A simple 32-bit RISC-V SoC on the RV32EC ISA, the project works by flashing the instruction code into the memory and observing the outputs over your desired method, via GPIO, UART or SPI
The TT10-IHP submission is based entirely on MichaelBell's TinyQV from TT-06.

## How to test

Flash the PMOD with instructions (somehow) and boot up the processor. The processor will start executing the instructions

## External hardware
- [QSPI + Flash PMOD](https://github.com/mole99/qspi-pmod)
