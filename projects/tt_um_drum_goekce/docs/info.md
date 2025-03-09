<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The design consists of a RAM and an approximate multiplier `a * b = r` based on DRUM: A Dynamic Range Unbiased Multiplier for
Approximate Applications by Hashemi et. al.

## How to test

`r = a * b`. Write data to `a` and `b`. Then read the result/s from the RAM. The product results should differ if the frequency is increased.

Address map:
- 0 to 7 => product result
- 8 => multiplicand 1
- 9 => multiplicand 2

## External hardware

Nothing.
