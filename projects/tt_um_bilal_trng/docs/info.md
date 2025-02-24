<!---
This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This True Random Number Generator (TRNG) operates by leveraging a noise source sampled by a digital circuit. The sampled data conditioning using SHA-256 to ensure cryptographic-quality randomness. A state machine controls data collection, processing, and output transmission via UART. The TRNG supports two modes: raw entropy output for analysis and hashed output for secure applications. Built-in health tests, such as the Repetition Count Test, verify entropy quality.

## How to test

1. Connect a UART terminal to receive random number outputs.
2. Select between raw entropy mode or hashed output mode via control signal. (default is 0 for Hashed output)
3. Monitor the output stream for randomness analysis or cryptographic use.
4. Run statistical tests to validate entropy quality. (Visit github @ sp 800-90b)

## External hardware

- ZCU102 FPGA Board
- UART-to-USB Adapter (for serial communication)
- Oscilloscope (for debugging noise source if needed)

