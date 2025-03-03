
<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This Verilog code implements a Pulse Width Modulation (PWM) generator designed for a 50 MHz input clock. The main functionality revolves around creating a variable duty cycle PWM signal and allowing user control to adjust the duty cycle through two input buttons. The module tt_um_nithishreddykvs uses a clock signal to generate a 10 MHz PWM output (PWM_OUT), with the duty cycle ranging from 0% to 90% in 10% increments.

To ensure reliable operation, debouncing logic is implemented for the buttons that increase (ui_in[0]) and decrease (ui_in[1]) the duty cycle. The debouncing mechanism uses D Flip-Flops (DFF_PWM) and a slow clock enable signal generated via a counter. The slow_clk_enable ensures that rapid fluctuations caused by button bouncing do not affect the duty cycle adjustment. The duty cycle can be dynamically updated by incrementing or decrementing its value through button presses, and this adjustment directly impacts the PWM signal's ON and OFF durations.

The module ensures that outputs and unused inputs are properly assigned to avoid any synthesis or simulation warnings, and a reset signal (rst_n) is included for reinitializing the design.

## How to test

#### 1.Simulation Environment:

- Use a Verilog simulator (such as ModelSim, Vivado, or Verilator) to verify the design.
- Apply a 50 MHz clock signal to the clk input.
- Provide test signals to ui_in[0] and ui_in[1] for increasing and decreasing the duty cycle.
- Observe the PWM_OUT signal to confirm that the duty cycle adjusts correctly in response to button presses.

#### 2.FPGA Testing:

- Synthesize the code for an FPGA board (e.g., Xilinx or Intel FPGA).
- Assign the ui_in signals to physical buttons or switches on the board for user interaction.
- Connect the PWM_OUT signal to an output pin that drives an LED or an oscilloscope for visual verification of the PWM waveform.
- Verify that the duty cycle changes in 10% increments as buttons are pressed and released.

## External hardware

#### Input Buttons:

Two push buttons are required for increasing and decreasing the duty cycle. These buttons are connected to ui_in[0] and ui_in[1]. Ensure pull-up or pull-down resistors are used to stabilize the input signals when buttons are not pressed.

#### PWM Output Device:

The PWM_OUT signal can be connected to an LED, motor, or any other device that can visually or functionally represent the PWM signal. For testing, an oscilloscope is recommended to observe the PWM waveform and verify the duty cycle.

#### Clock Source:

A 50 MHz clock signal is essential for driving the design. This can be provided by the FPGA's onboard oscillator or an external clock module.

#### Reset and Power Supply:

A reset button should be included to initialize the system via the rst_n signal. The design should also include appropriate voltage levels (e.g., 3.3V or 5V) as per the FPGA board's requirements.

#### FPGA Board:

Use an FPGA development board that supports 50 MHz clock input and has sufficient GPIO pins to connect the input buttons and PWM output. Popular choices include Xilinx Artix-7 or Basys-3.
