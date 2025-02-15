## How it works

This circuit is a Current-Mode Bandgap Reference which is fully 
self-biased. It is powered from a nominal 3.3V supply. 

It produces a 1V reference voltage and a 5.6uA output current. 

In order to measure the very sensitive output voltage of the bandgap
reference, a testbuffer is also included in the design. 
The testbuffer is biased from a external current source (~5uA) through pin
ua[2].  

To characterize the testbuffer a loop-through mechanism from ua[1] to
ua[0] can be enabled. The test voltage can be applied to ua[1] 
and then measured back at ua[0].  

The bandgap core can be enabled/disabled using the signal on uio_in[2].  

To trim out process variations the core can be trimmed with a 8 bit 
correction resistor controlled from the tiny-tapeout managment area
using ui_in[7:0].  


## How to test

Testing the testbuffer.
-----------------------
1. Power VAPWR to 3.3V
2. Apply ~5uA bias current to the testbuffer on ua[2].
   SMU or 620kOhm from 3.3V.
3. Apply external test voltage to input on ua[1].
4. Route external voltage to testbuffer input. uio_in[0]=1
5. Route buffered voltage to output. uio_in[1]=1
6. Measure voltage back on ua[0].


Testing the bandgap voltage.
----------------------------
1. Power VAPWR to 3.3V
2. Apply ~5uA bias current to the testbuffer on ua[2].
   SMU or 620kOhm from 3.3V.
3. Enable bandgap core. uio_in[0]=1
4. Route bandgap voltage to testbuffer input. uio_in[0]=0
5. Route buffered bandgap voltage to output pin. uio_in[1]=1
6. Measure voltage on ua[0].


Testing the reference current.
------------------------------
1. Power VAPWR to 3.3V
2. Enable bandgap core. uio_in[0]=1
3. Route reference current to output pin. uio_in[1]=1
4. measure current from ua[0] to GND.


## External hardware

Multimeter to measure voltage and current.

Optional: 
Osciloscope to measure startup waveform.
Precise power supply for VAPWR
SMU for precission bias current.
Oven to measure temperature stabililty.
