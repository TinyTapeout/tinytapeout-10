<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## Danger!

* Enabling this design without first removing the 3.3v VAPWR will blow the design.
* The 3.3v VAPWR rail is used as a variable supply to a single inverter. 
* You must remove the VDDA 0 ohm resistor on the breakout board, and provide 1.8v.

## How it works

The [traditional level shifter](https://xschem-viewer.com/?file=https://github.com/mattvenn/tt10-level-shifter/blob/main/xschem/level_shifter.sch) only works down to about 1v.

This [level shifter](https://xschem-viewer.com/?file=https%3A%2F%2Fgithub.com%2Fmattvenn%2Ftt10-level-shifter%2Fblob%2Fmain%2Fxschem%2Flevel_shifter2.sch) was designed by Sylvain Munaut and operates down to around 0.2v.

![graph](level_graph.png)

Graph shows an input signal of 0.2v resulting in a full swing 1.8v on the output.

### Theory of operation

![level](level_schematic.png)

* M4 and M11 create a reference voltage `src_n` about half of VDD_L.
* M2, M3 and M1 create a current source for the differential pair.
* M5 and M6 are the differential pair, with the `src_n` on one side and the input on the other.
* M7 and M8 are the current mirror, along with M1, M5 and M6 they create the classical opamp comparitor.
* Finally the output is buffered through M10 and M9 as an inverter.

This design features 2 of these level shifters, one connected to the digital pins and one to the analog.

### Digital version

ui[0] is connected to the input of an inverter standard cell. The inverter is powered by the low power rail (VAPWR).

The level shifter receives input from the inverter and outputs to uo[0].

### Analog version

Analog pins In, Out and VDD_L are connected to the level shifter. VDD comes from the 1.8v supply.

## How to test

### Digital version

* Set up the variable PSU (see above), and set it to 1.8v.
* Input a test signal to A: ui[0].
* Observe output signal on Y: uo[0].
* Lower the variable PSU and the output signal should stay full swing until about 0.2v.

### Analog version

* Supply 1.8v or less to `vdd_l` pin.
* Supply test input signal to the `in` pin.
* Observe the `out` pin.
* Lower the variable PSU and the output signal should stay full swing until about 0.2v.

## External hardware

* Adjustable power supply
* Soldering iron to remove the resistor
* Scope to observe output signal
