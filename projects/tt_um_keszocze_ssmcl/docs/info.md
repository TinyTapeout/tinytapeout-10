<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This design contains a three-bit multiplier that aims to be area/resource efficient at the expense of using multiple clock cycles to compute the product.

 When `start` is asserted, the values at the `x` and `y` inputs are then being streamed into the actual multiplier, taking 3 cycles in total. The multiplier computes the product in 9 cycles and then steams back the 6-bit product in 6 cycles. The result can be seen at the output bit in cycle 18. This is illustrated by the simplified wave trace below.

![simplified wave trace for the 3-bit multiplier](int3.png)

The result will be held until the next multiplication starts streaming back its result (the streaming aspect is fully hidden from the end user in this design!). The following wave trace shows this in full detail (there might be an off-by-one error there; I tend to make those. The general mode of operation is correctly captured by the trace!).


![long wave trace for the 3-bit multiplier](int3_full.png)

## How to test

The input to the multiplier can conveniently be controlled using the web interface of the motherboard. Alternatively, you can connect the input/ouptut pmods as shown in the table in the pinout section below.