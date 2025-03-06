<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project is a compact UART transceiver with an integrated display update mechanism. It operates at 115200 baud and stores received data in a 16-byte internal buffer. 
The data is asynchronously transferred to four HPDL-1414 alphanumeric LED modules. When new characters arrive and the buffer is full, the existing characters shift left to make space. A blinking cursor indicates the current input position, and backspace (Ctrl-H) is supported for navigating back and  editing.

## How to test

1. Connect the UART interface to a computer or microcontroller configured at 115200 baud.
2. Send ASCII characters over the UART interface.
3. Observe the received characters displayed on the HPDL-1414 modules.
4. Test the character shifting behavior by exceeding 16 characters.
5. Use Ctrl-H to test the backspace functionality.


## External hardware

HPDL-1414 Pmod module 
https://github.com/ADDTDR/HPDL-1414-Pmod-Module


![hpdl-1414 pmod](img/image.png)


## Signal test 
![alt text](<img/Screenshot from 2025-02-26 22-02-32.png>)