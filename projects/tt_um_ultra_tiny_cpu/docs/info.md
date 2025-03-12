<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The **UltraTiny-CPU** is a minimal 8-bit CPU with a small instruction set (ALU, data flow, and control flow). It has:

- **Accumulator (ACC)** as the primary register  
- **Register B** as a secondary register  
- **Program Counter (PC)** to fetch instructions from an internal 16-byte memory  
- **Instruction Register (IR)** to decode the current operation  

The CPU features a “load mode” that writes data or instructions into the memory and a “run mode” that fetches and executes those instructions:

1. **Load Mode**:  
   - Activated when `ui[7] == 1`.  
   - The address to write is placed on `ui[3:0]`.  
   - The data/instruction byte is supplied on `uio[7:0]` and written into memory.

2. **Run Mode**:  
   - Activated when `ui[7] == 0` and `ena == 1`.  
   - The CPU fetches the instruction from memory at `PC`, decodes it, performs the operation (arithmetic, logic, load/store, or branch), and increments or modifies `PC` accordingly.  
   - The result of arithmetic/logical operations is stored in the accumulator (`ACC`), and its value is driven onto `uo[7:0]`.

## How to test

1. **Enter Load Mode** (`ui[7] = 1`):  
   - Provide a memory address (0 to 15) on `ui[3:0]`.  
   - Provide an 8-bit instruction/data on `uio[7:0]`.  
   - Toggle `clk` to store that byte into internal memory.  
   - Repeat for as many instructions/data bytes as needed.

2. **Run the Program**:  
   - Switch to Run Mode (`ui[7] = 0`).  
   - Ensure `ena = 1` (the CPU is enabled).  
   - The CPU will begin fetching instructions starting at address 0.  
   - Observe the accumulator outputs on `uo[7:0]` to see results of execution.

If your design environment simulates clocking and signals, you can watch the memory load process and the CPU fetch/execute cycle in a waveform viewer or on actual hardware.

## External hardware

No external hardware is strictly required. The UltraTiny-CPU operates solely with its on-chip 16-byte memory and the provided I/O pins. You can optionally attach an external logic analyzer or an LED display to the accumulator outputs (`uo[7:0]`) if you want a visual indication of the CPU state. Otherwise, all interfacing can be done directly via the pin signals.

