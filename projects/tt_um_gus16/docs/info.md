<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project includes a 16-bit experimental CPU (GUS16) with a serial port and a few more peripherals (see GUS16_tt.pdf). Memory has to be provided externally. An included bootloader allows the execution of programs loaded through the serial port.

## How to test

Connect a serial port 8-bit, no parity, 115200 bps, and send an 'L'. The bootloader code should reply with another 'L'.
For more complete tests an external board with SRAM memory and address latches has to be attached to the PMOD ports of the prototype board.

## External hardware

A memory board has to be attached to user PMOD connectors (still pending design)

## More docs
https://www.ele.uva.es/~jesus/cpu_v2.pdf  (older designs, spanish)

https://www.ele.uva.es/~jesus/GUS16v6.pdf (current CPU version)

https://www.ele.uva.es/~jesus/a2.pdf      (CPU usage in a floppy disk emulator for apple-IIs in FPGAs)

