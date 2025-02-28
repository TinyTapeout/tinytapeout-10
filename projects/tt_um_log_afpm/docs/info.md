> ## 📌 Credits  
>  
> We sincerely acknowledge the **Center of Excellence in Integrated Circuits and Systems (CoE-ICAS)** and the **Department of Electronics and Communication Engineering, RV College of Engineering, Bengaluru**, for their invaluable support in providing us with the necessary knowledge and training.  
> 
> We extend our special gratitude to **Dr. H V Ravish Aradhya (HoD, ECE)**, **Dr. K S Geetha (Vice Principal)** and **Dr. K N Subramanya (Principal)** for their continuous encouragement and support, enabling us to achieve **TAPEOUT** in **Tiny Tapeout 10**.  
>  
> We are also deeply grateful to **Mahaa Santeep G (RVCE Alumni)** for his mentorship and invaluable guidance throughout the completion of this project.  
  

The code provided is a Verilog module that implements a 16-bit logarithmic approximate floating-point multiplier. This module utilizes logarithmic approximation techniques to perform floating-point multiplication efficiently, reducing computational complexity while maintaining accuracy. It incorporates a state machine that processes the LSB(lower 8 bits) of the inputs in the first cycle and the MSB(upper 8 bits) in the next cycle, subsequently producing the LSB(lower 8 bits) of the output first, followed by the MSB(upper 8 bits) in the next cycle.

Key Components

The Logarithmic Approximate Floating-Point Multiplier (LAFPM) is a hardware-efficient multiplier that processes two 16-bit floating-point numbers using logarithmic approximation techniques. Instead of traditional multiplication, this design reduces complexity by leveraging logarithmic transformations, shifts, and additions. This approach significantly lowers power consumption and area, making it ideal for resource-constrained applications such as machine learning accelerators and embedded systems.
The multiplier operates using a finite state machine (FSM) that progresses through several key states:

**IDLE** – The system remains in this state until a non-zero input is detected. Once an input is received, it transitions to the next stage.

**COLLECT** – The multiplier collects the two 8-bit portions of each operand over multiple cycles to reconstruct the 16-bit floating-point numbers. After both parts are received, it moves to processing.

**PROCESS_1** – The floating-point components, including the sign, exponent, and mantissa, are extracted for further computation.

**PROCESS_2** – The mantissas undergo logarithmic approximation through bit-shifting techniques, reducing the complexity of multiplication.

**PROCESS_3** – The approximated mantissas are added together using a logarithmic-based summation.

**PROCESS_4** – A carry-out bit is determined, which helps adjust the exponent in the next stage.

**PROCESS_5** – The new exponent is computed, and an additional approximation step refines the mantissa for better accuracy.

**PROCESS_6** – The final floating-point result is assembled, combining the computed sign, exponent, and mantissa.

**OUTPUT** – The computed result is transmitted over multiple cycles. Once completed, the system returns to the IDLE state, ready for the next operation.

**Inputs and Clock Frequency**

**u_in and uio_in** are used to receive operands A and B through multiple cycles.

**rst_n** is the active-low reset signal.

**clk** operates at a 50 MHz frequency.

Table: State Transition for FP-16 Multiplication of (0x43BC)*(0x4190)
| **Time (ns)** | **ui_in (Input A)** | **uio_in (Input B)**      | **Reset** | **State**            | **uo_out (Output)** | **Clock** |
|---------------|---------------------|---------------------------|-----------|----------------------|---------------------|-----------|
| 0             | `00000000`          | `00000000`                |  0        | Reset                | `xxxxxxxx`          |0          |
| 10            | `00000000`          | `00000000`                |  0        | Reset                | `00000000`          |1          |
| 20            | `10111100`          | `10010000`                |  1        | Reset                | `00000000`          |0          |
| 30            | `10111100`          | `10010000`                |  1        | IDLE                 | `00000000`          |1          |
| 50            | `10111100`          | `10010000`                |  1        | COLLECT_1            | `00000000`          |1          |
| 60            | `01000011`          | `01000001`                |  1        | COLLECT_1            | `00000000`          |0          |
| 70            | `01000011`          | `01000001`                |  1        | COLLECT_2            | `00000000`          |1          |
| 90            | `01000011`          | `01000001`                |  1        | PROCESS_1            | `00000000`          |1          |
| 110           | `01000011`          | `01000001`                |  1        | PROCESS_2            | `00000000`          |1          |
| 130           | `01000011`          | `01000001`                |  1        | PROCESS_3            | `00000000`          |1          |
| 150           | `01000011`          | `01000001`                |  1        | PROCESS_4            | `00000000`          |1          |
| 170           | `01000011`          | `01000001`                |  1        | PROCESS_5            | `00000000`          |1          |
| 190           | `01000011`          | `01000001`                |  1        | PROCESS_6            | `00000000`          |1          |
| 210           | `01000011`          | `01000001`                |  1        | OUTPUT_1             | `01110101`          |1          |
| 220           | `01000011`          | `01000001`                |  1        | OUTPUT_1             | `01110101`          |0          |
| 230           | `01000011`          | `01000001`                |  1        | OUTPUT_2             | `01001001`          |1          |
| 240           | `01000011`          | `01000001`                |  1        | OUTPUT_2             | `01001001`          |0          |


Other Operands can also given as follows:
Table: Multiple Operands with Expected output
| **Input A** | **Input B** | **Output**  |
|--------------|--------------|------------|
| `0x4871`     | `0x482e`     | `0x54a6`   |
| `0x41bd`     | `0x46ef`     | `0x4d31`   |
| `0x436c`   | `0x45aa`     | `0x4d4c`   |
| `ox44df`     | `0x483d`     | `50x12c`  |
