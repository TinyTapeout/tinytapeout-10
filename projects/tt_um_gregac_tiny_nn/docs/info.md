## How it works

This project is a neural network accelerator designed for use with convolutional
neural networks. The verilog is generated from system verilog source which lives
in a separate repository: https://github.com/GregAC/tiny-nn which also contains
the full DV environment, model, documentation and related utilities and
software.

Internally it contains a number of 16-bit floating point add and multiply units
(using something approximating the BF16 floating point encoding) that can be
configured to work in different ways for different operations. Operations
available are

 - Convolve - Computes a 4x2 convolution kernel across an image. The parameters
   are loaded in and held in flops then the image is streamed in one pixel at a
   time. The most recent 4x2 image pixels are also held in flops so every 2 new
   pixels giving a new image column computes a new convolution (internally the
   last image column is dropped and the new column shifted in).
 - Accumulate - Sum groups of N input numbers with a fixed bias added and an
   optional RELU operation (0 if accumulation less than 0 otherwise leaves
   accumulation untouched). N is provided by the operation word and the bias is
   only loaded in once. E.g. if you set N = 4 an bias of 1.0 for each 4 numbers
   input it would sum them together then add the bias and do the optional RELU.
   Numbers keep streaming in until the operation is terminated

The interface is a fixed 16 bits in and 8 bits out synchronous to the clock.
Each operation has a special operand code that starts it that needs to be sent
on the 16 input bits. Once started the 16 input bits provide the numbers used
for the operation.

The 16-bit numbers output are split over 2 clock cycles for the 8 bit output.
With the lower byte output first. The user needs to know when the output is
relevant (some cycles the output should be ignored and some it should be
captured).

- ui_in, uio_in - 16-bit input, ui_in is top byte
- uio_out - 8-bit output

https://github.com/GregAC/tiny-nn should contain full documentation with the
details and software to use the accelerator (both a work in progress at tapeout
time!).

## How to test

The simplest operation is the accumulate one. We'll configure it to add two
numbers at a time with a -3.5 bias and RELU. Then we'll add 1.0 + 2.0 and 3.0 +
4.0. Put the following on the input over successive clocks

 - 16'h2101 # Command word for accumulate operation
 - 16'hc060 # -3.5 bias
 - 16'h3f80 # 1.0
 - 16'h4000 # 2.0
 - 16'h4040 # 3.0
 - 16'h4080 # 4.0
 - 16'hffff # NaN - terminates operation

On the output you should observe:

 - 16'hX
 - 16'hX
 - 16'hX
 - 16'hX
 - 16'h00
 - 16'h00
 - 16'h60
 - 16'h40

The 16'hX outputs could be anything and should be ignored, the first number
output is 0000 representing 0.0 RELU(1.0 + 2.0 - 3.5) = 0.0, the second number
output is 4060 representing 3.5 RELU(3.0 + 4.0 - 3.5) = 3.5.

## External hardware

No specific external hardware required but it does need some external part to
drive the desired sequences, this can be handled by the RP2040 on the demo
board.
