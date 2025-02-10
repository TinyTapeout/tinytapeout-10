<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This ASIC compresses ASCII characters into Huffman codes, using a lookup table.

## How to test

Send an ASCII character to ui[6:0], set ui[7] = 1 (Load), wait for valid_out = 1, then read the Huffman code from uo and uio.

## External hardware

To communicate with the ASIC, you need either the RP2040 or an external MCU to send ASCII input and read the compressed Huffman output.
