<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This is a floating point unit accesible over SPI.
```
SCLK = ui[0]
NCS  = ui[1]
COPI = ui[2]
CIPO = uo[0]
```

Constraint ``frequency(SCLK) < 4*frequency(clk)``

It features 4 internal floating point registers, writeable and readable
over SPI.


Every SPI transaction starts with a command byte followed
by the arguments to the command.
If the command outputs data, enough bytes need to be sent for the
entire data to be received.
```
+-------+---------+--- ... -+
|Command|Arguments|...      |
+-------+---------+--- ... -+
```

### WRITE_TO_REG

Writes a floating point value (serialized on COPI) into 
an internal floating point register.

```
    +----+----+----+----+----+----+
IN: |0x00|0x0r|b[0]|b[1]|b[2]|b[3]|
    +----+----+----+----+----+----+
OUT:| und| und| und| und| und| und|
    +----+----+----+----+----+----+
```

r is one of 0,1,2,3 corresponding to the 4 internal registers.
b[0] is the lowest byte of the floating point value.
b[3] is the highest byte.

### PERFORM_ADD
Performs the computation
``register[in_c] = fadd(register[in_a], register[in_b])``
This computation takes a couple of cycles (6 I think right now).
These cycles are in reference to ``clk`` **not** to SCLK.
Nevertheless add another dummy byte after the  command to ensure that the 
add is being performed.

```
    +----+----+----+----+----+
IN: |0x00|in_a|in_b|in_c|0x00|
    +----+----+----+----+----+
OUT:| und| und| und| und| und|
    +----+----+----+----+----+
```

in_a,in_b,in_c can be one of 0x00,0x01,0x02,0x03

### READ_FROM_REG
Reads a float from the internal register and serialises it on CIPO.

```
    +----+----+----+----+----+----+
IN: |0x00|0x0r|xxxx|xxxx|xxxx|xxxx|
    +----+----+----+----+----+----+
OUT:| und| und|b[0]|b[1]|b[2]|b[3]|
    +----+----+----+----+----+----+
```

r is one of 0,1,2,3
b[0] is the lowest  byte of the float
b[3] is the highest byte of the float




## How to test

It is best to test with the provided arduino testbench in the repository
``https://github.com/Qwendu/tt_float_adder``
in the directory ``src/testbenches/arduino_integration_test``.

I have not managed to get it to work with the provided SPI controllers in arduino.
Maybe this is because my ``spi_rx`` has some bugs.


## External hardware

For integration test:
- Arduino


## Known Bugs

- [1] Denormalized numbers do not always add correctly.

- [2] When testing on an fpga it was observed that it sometimes worked flawlessly and othertimes the output was always 0.
	  to what extent that was a fault of the testsetup or the tester  or the actual code has yet to be determined.
