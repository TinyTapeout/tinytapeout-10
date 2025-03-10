# Bitty System: RTL Design and Verification Framework

This project implements a custom 16-bit processing system, including hardware modules for program counter (PC), instruction fetch, branch logic, UART communication, and integration with the **BittyEmulator** for co-simulation. The provided system allows robust testing of a Verilog-based design using a Python-based cocotb testbench. The testbench orchestrates data transfer via UART, interacts with shared memory, and verifies execution against the emulator.

## System Overview

### Core Components

![Без имени](https://github.com/user-attachments/assets/89a714ac-a5bf-4ce8-848c-53a10e8f25c2)


1. **Program Counter (PC)**:
   - Handles sequential and branch-based instruction execution.
   - Interfaces directly with the branch logic for control flow changes.

2. **Instruction Fetch Unit**:
   - Reads and decodes instructions from memory.
   - Supplies data to the rest of the system.

3. **Branch Logic**:
   - Evaluates branch conditions and modifies the PC as needed.

4. **UART Module**:
   - Supports data exchange between the testbench and the DUT.
   - Operates with customizable baud rates and clock frequencies.

5. **Bitty Emulator**:
   - Acts as a functional reference model.
   - Validates the outputs and internal states of the hardware implementation.
   - Includes: Control Unit, registers, ALU, mux

![Bitty Top Module](https://github.com/user-attachments/assets/014e15a3-a683-4d05-b81a-df736bac68e0)
  

### Memory Map
- **Shared Memory**:
  - Synchronizes data between the testbench, the hardware design (DUT), and the emulator.
  - Supports up to 256 entries.
- **Instruction Set**:
  - Defined in `instructions_for_em.txt`, loaded by the testbench for execution.
Here’s the revised version written as a description of a fully implemented system:

---

# Instruction Set Architecture: Fully Implemented 16-bit Processor

## Overview
This document outlines the complete instruction set architecture (ISA) for a 16-bit processor, detailing its capabilities, operations, and encoding formats. The ISA is designed to deliver robust functionality for arithmetic, logical, control flow, and memory operations while maintaining a simple, efficient structure. 

The processor's instruction set enables dynamic memory interactions, conditional branching, and a wide range of data manipulation tasks, providing the foundation for executing complex algorithms and software applications.

---

## Instruction Set

### Arithmetic and Logical Operations
The processor supports both register-to-register and immediate operations, enabling developers to perform computations efficiently.

#### Register-to-Register Instructions:
![изображение](https://github.com/user-attachments/assets/b1454521-2a92-45fc-b547-fbd8fe1f2261)

1. **add rx, ry**: Adds the value in `ry` to `rx`.  
   - **Operation**: `rx = rx + ry`  

2. **sub rx, ry**: Subtracts the value in `ry` from `rx`.  
   - **Operation**: `rx = rx - ry`  

3. **and rx, ry**: Performs a bitwise AND between `rx` and `ry`.  
   - **Operation**: `rx = rx & ry`  

4. **or rx, ry**: Performs a bitwise OR between `rx` and `ry`.  
   - **Operation**: `rx = rx | ry`  

5. **xor rx, ry**: Performs a bitwise XOR between `rx` and `ry`.  
   - **Operation**: `rx = rx ^ ry`  

6. **shl rx, ry**: Shifts the bits in `rx` left by the number of positions specified in `ry`.  
   - **Operation**: `rx = rx << ry`  

7. **shr rx, ry**: Shifts the bits in `rx` right by the number of positions specified in `ry`.  
   - **Operation**: `rx = rx >> ry`  

8. **cmp rx, ry**: Compares the values in `rx` and `ry`.  
   - **Operation**:  
     - `rx = 0` if `rx == ry`  
     - `rx = 1` if `rx > ry`  
     - `rx = 2` if `rx < ry`

#### Immediate Instructions:
![изображение](https://github.com/user-attachments/assets/80d8e5af-8566-4012-aac6-4c6a7dfcd78e)

1. **addi rx, #i**: Adds the immediate value `#i` to `rx`.  
   - **Operation**: `rx = rx + #i`  

2. **subi rx, #i**: Subtracts the immediate value `#i` from `rx`.  
   - **Operation**: `rx = rx - #i`  

3. **andi rx, #i**: Performs a bitwise AND between `rx` and `#i`.  
   - **Operation**: `rx = rx & #i`  

4. **ori rx, #i**: Performs a bitwise OR between `rx` and `#i`.  
   - **Operation**: `rx = rx | #i`  

5. **xori rx, #i**: Performs a bitwise XOR between `rx` and `#i`.  
   - **Operation**: `rx = rx ^ #i`  

6. **shli rx, #i**: Shifts `rx` left by `#i` positions.  
   - **Operation**: `rx = rx << #i`  

7. **shri rx, #i**: Shifts `rx` right by `#i` positions.  
   - **Operation**: `rx = rx >> #i`  

8. **cmpi rx, #i**: Compares the value in `rx` with the immediate value `#i`.  
   - **Operation**:  
     - `rx = 0` if `rx == #i`  
     - `rx = 1` if `rx > #i`  
     - `rx = 2` if `rx < #i`  

---

## Memory Operations

### Load and Store Instructions:
![изображение](https://github.com/user-attachments/assets/2c9b7a5f-7767-4e89-ab02-ae14c18b3f13)

1. **ld rx, (ry)**: Loads the value from the memory address stored in `ry` into register `rx`.  
   - **Operation**: `rx = mem[ry]`  

2. **st rx, (ry)**: Stores the value in register `rx` into the memory address stored in `ry`.  
   - **Operation**: `mem[ry] = rx`

### Encoding Format:
- **Bits 15-13 (Rx)**: Destination register for `ld` or source register for `st`.
- **Bits 12-10 (Ry)**: Register holding the memory address.
- **Bits 9-3 (Reserved)**: Reserved for future extensions, currently set to zero.
- **Bit 2 (L/S)**: Load/Store flag (`0` for `ld`, `1` for `st`).
- **Bits 1-0**: Instruction format identifier (`11` for memory operations).

---

## Conditional Branching

The processor supports conditional branching with a dedicated encoding format for efficient control flow.

### Conditional Branch Instructions:
![изображение](https://github.com/user-attachments/assets/8477fef7-e53d-4435-add6-718fb6975fca)

1. **bie addr**: Branch if equal (condition flag `EQ` is set).  
2. **big addr**: Branch if greater (condition flag `GT` is set).  
3. **bil addr**: Branch if less (condition flag `LT` is set).  

### Encoding Format:
- **Bits 15-4 (Immediate)**: Encodes the branch target address.
- **Bits 3-2 (Condition)**:  
  - `00`: Equal  
  - `01`: Greater than  
  - `10`: Less than  
- **Bits 1-0 (Format)**: Instruction format identifier (`10` for conditional branching).


---

Here’s a detailed step-by-step guide for users to set up and test their system with the assembler and testbench:

---

## How to Use the System

Before running the testbench, you must first prepare the assembly instructions or machine code. Here’s how:

### Step 1: Prepare Instructions
1. **Option 1**: Generate machine code automatically  
   Run the `CIG_run.py` script to generate `output.txt` automatically with pre-defined assembly instructions.  
   ```bash
   python3 CIG_run.py
   ```
   This will create `output.txt` containing machine code.

2. **Option 2**: Write custom assembly instructions  
   If you prefer to write your own instructions, directly create or modify the `output.txt` file. These instructions will later be disassembled for further testing.

### Step 2: Disassemble Machine Code
Disassemble the `output.txt` file (machine code) to generate `instructions_for_em.txt` (assembly code):  
```bash
./er_tool -d -i output.txt -o instructions_for_em.txt
```
This step ensures that the instructions in `instructions_for_em.txt` are ready for use in the testbench.

---

## Running the Testbench

Once you have the `instructions_for_em.txt` file ready, navigate to the `bitty-tt10/test` directory and execute the testbench using `make`:
```bash
cd ~/bitty-tt10/test
make
```

The testbench will:
1. Load the instructions from `instructions_for_em.txt`.
2. Simulate UART communication for instruction execution.
3. Compare the outputs of the DUT (Device Under Test) with expected results.
4. Log the results, including any discrepancies, into `uart_emulator_log.txt`.

---

### Testbench Overview

#### **Assembling Code**
To convert `instructions_for_em.txt` into machine code (if needed for testing):
```bash
./er_tool -a -i instructions_for_em.txt -o output.txt 
```

#### **Disassembling Code**
To convert machine code (`output.txt`) back into assembly:
```bash
./er_tool -d -i output.txt -o instructions_for_em.txt 
```

---

### Practical Workflow Example

1. **Generate Machine Code**:  
   Run `CIG_run.py` to create machine code:
   ```bash
   python3 CIG_run.py
   ```

2. **Disassemble Code**:  
   Use the `er_tool` to create `instructions_for_em.txt`:
   ```bash
   ./er_tool -d -i output.txt -o instructions_for_em.txt
   ```

3. **Run Testbench**:  
   Navigate to the test directory and run the testbench:
   ```bash
   cd ~/bitty-tt10/test
   make
   ```

---

### Key Features of the Testbench
- **Simulated UART Communication**: Generates UART signals and captures DUT transmissions.
- **Instruction Execution**: Fetches and executes instructions in real-time.
- **State Validation**: Logs and compares DUT outputs with expected results.
- **Error Reporting**: Logs any mismatches in `uart_emulator_log.txt`.

---

Following these steps ensures smooth operation from writing or generating instructions to verifying the system’s functionality. If you encounter issues, double-check the prepared files or logs for guidance. Let me know if you need further clarification!
## How to Use

### Setup
1. **Prerequisites**:
   - Install Python and cocotb.
   - Ensure Verilog simulation tools (Verilator, Iverilog) are installed.
   - Use the following command to install the dependencies:
   ```bash
      pip install -r requirements.txt
   ```

2. **Input Files**:
   - Place the instruction file (`instructions_for_em.txt`) in the working directory.
   - Modify the file as needed to test specific scenarios.

3. **Shared Libraries**:
   - Ensure `BittyEmulator.py` and `shared_memory.py` are in the project directory.

### Running the Test
1. Execute the cocotb testbench:
   ```bash
   make
   ```

2. Observe the test results in the terminal and logs:
   - Successes and failures are detailed in `uart_emulator_log.txt`.

---

## External Hardware

This system does not require external hardware. UART communication is emulated within the testbench.

---

## Files Overview

### Verilog Files
- **`<module_name>.v`**: Contains the RTL design files for the system.
- **`tb_<module_name>.v`**: Top-level Verilog testbench wrapper.

### Python Files
- **`test_bitty.py`**: The cocotb testbench described above.
- **`BittyEmulator.py`**: Emulator for reference model validation.
- **`shared_memory.py`**: Utility for creating shared memory structures.

---

## Limitations and Future Work
1. **Hardware Expansion**:
   - Current implementation is limited to basic arithmetic and control operations.
   - Future iterations could incorporate advanced features like pipelining or caching.

2. **Error Handling**:
   - Expand error reporting for unresolved signals during simulation.

3. **Scalability**:
   - Extend memory and instruction sets for larger programs.

--- 

This project demonstrates a robust framework for RTL verification, combining software co-simulation with hardware modeling for high-fidelity testing and validation.
