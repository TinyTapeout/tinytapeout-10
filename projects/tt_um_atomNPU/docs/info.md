<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The **AtomNPU** (Neural Processing Unit) is a compact, 4-bit processing module designed to perform basic **multiply-accumulate (MAC)** operations, essential for neural network computations. This NPU efficiently processes input activations and weights to produce quantized output results.

### **Functional Components**

1. **Inputs:**
   - **`input_data [3:0]` (`ui_in[3:0]`):** Represents the 4-bit activation vector input to the NPU.
   - **`weight [3:0]` (`uio_in[3:0]`):** Represents the 4-bit weight vector applied to the activation vector.
   - **`start` (`uio_in[4]`):** A control signal that initiates the MAC operation.
   
2. **Outputs:**
   - **`output_data [3:0]` (`uo_out[3:0]`):** The 4-bit result of the multiply-accumulate operation.
   - **`done` (`uo_out[4]`):** A status signal indicating the completion of the MAC operation.

3. **Control Signals:**
   - **`clk` (Clock):** Synchronizes the operations within the NPU.
   - **`rst_n` (Reset):** An active-low signal that resets the NPU to its initial state.

### **Operational Workflow**

1. **Initialization (IDLE State):**
   - Upon receiving a **reset (`rst_n` low)**, the NPU enters the **IDLE** state.
   - All internal registers, including the accumulator and bit counter, are reset to `0`.
   - The `done` signal is deasserted (`0`).

2. **Start Operation (CALC State):**
   - When the **`start`** signal is asserted (`1`), the NPU transitions from **IDLE** to **CALC**.
   - The **`input_data`** and **`weight`** vectors are loaded into their respective registers.
   - The accumulator is initialized to `0`, and the bit counter is reset to `0`.

3. **Multiply-Accumulate Process:**
   - The NPU processes each bit of the **`weight`** vector in a **shift-add** manner over **4 clock cycles** (one for each bit).
   - **For each bit (`bit_count` from `0` to `3`):**
     - **Check the Least Significant Bit (LSB) of `weight`:**
       - If the LSB (`weight[0]`) is `1`, the **`input_data`** is **left-shifted** by the current `bit_count` and **added** to the accumulator.
       - This effectively multiplies the **`input_data`** by the corresponding bit weight.
     - **Shift Right:** The **`weight`** is shifted right by `1` bit to process the next bit in the subsequent cycle.
     - **Increment Bit Counter:** Moves to the next bit.

4. **Completion (DONE State):**
   - After processing all 4 bits, the NPU transitions to the **DONE** state.
   - **Clamping Logic:** 
     - If the **accumulator** exceeds `15` (`8'd15`), the **`output_data`** is clamped to `15` to maintain the 4-bit width.
     - Otherwise, the accumulator's lower 4 bits are assigned to **`output_data`**.
   - The **`done`** signal is asserted (`1`) to indicate the operation's completion.
   - The NPU returns to the **IDLE** state, ready for the next operation.

### **Clamping Mechanism**

To prevent overflow and ensure the output remains within the 4-bit constraint, the NPU incorporates a **clamping mechanism**:

- **Condition:** If the **accumulator** value after the MAC operation exceeds `15`.
- **Action:** The **`output_data`** is set to `15` (`4'd15`).
- **Else:** The **`output_data`** reflects the accumulator's value.

## How to test

Below is a step-by-step guide to facilitate thorough testing.

### **Testing Procedure**

1.  **Initialization:**
    
    -   **Power Up:** Ensure the ASIC is properly powered.
    -   **Reset:** Press the **reset button** (asserting `rst_n` low) to initialize the NPU.
2.  **Setting Inputs:**
    
    -   **Input Data (`input_data [3:0]`):**
        -   Use **switches/buttons** connected to `ui_in[3:0]` to set the 4-bit activation vector.
    -   **Weight (`weight [3:0]`):**
        -   Use **switches/buttons** connected to `uio_in[3:0]` to set the 4-bit weight vector.
3.  **Initiating Operation:**
    
    -   Press the **`start` button** (connected to `uio_in[4]`) to begin the MAC operation.
    -   The **`start`** signal is internally connected to initiate the NPU's state machine.
4.  **Observing Outputs:**
    
    -   **`output_data [3:0]` (`uo_out[3:0]`):**
        -   Observe the **LEDs** connected to `uo_out[3:0]` to view the resulting 4-bit output.
    -   **`done` Signal (`uo_out[4]`):**
        -   The **status LED** connected to `uo_out[4]` will illuminate (`1`) once the operation is complete.

## External hardware

List external hardware used in your project (e.g. PMOD, LED display, etc), if any
