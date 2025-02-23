<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

A simple "inner project" drives a seven-segment display from either an internal 4-bit counter or from a 4-bit value presented on `ui[4:1]`.

The "outer project" adds a boundary scan register and JTAG TAP that supports the following instructions:
- `IDCODE`
- `SAMPLE`/`PRELOAD`
- `EXTEST`
- `INTEST`
- `CLAMP`
- `BYPASS`

## How to test

At startup, the project will drive the seven-segment display from either the internal 4-bit counter (if `ui[0]` is low) or from `ui[4:1]` (if `ui[0]` is high).

A [BSDL file](../bsdl/tt10.bsd) is provided for testing the TAP and boundary scan register. A tool like [UrJTAG](https://urjtag.sourceforge.io) can be used to control the output pins (via the `EXTEST` instruction) or to test the inner project (via the `INTEST` instruction).

## External hardware

JTAG adapter connected to `uio[7:4]`
