<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project includes a RISC-V CPU (LaRVa) with a serial port and a few more peripherals. Memory has to be provided externally. An included bootloader allows the execution of programs loaded through the serial port. (See TinyTlaRVa.pdf file)
As a last addition a JTAG interface is also included. (See jtag_laRVaTT.pdf file)

## How to test

Connect a serial port 8-bit, no parity, 115200 bps, and send an 'L'. The bootloader code should reply with another 'L'.
For more complete tests an external board with SRAM memory and address latches has to be attached to the PMOD ports of the prototype board.
Also, some testing could be carried out using the JTAG port.

## External hardware

A memory board has to be attached to user PMOD connectors.

## More docs
https://www.ele.uva.es/~jesus/larva.pdf

https://www.ele.uva.es/~jesus/larva_perif.pdf

