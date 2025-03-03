<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

An Asynchronous FIFO is a memory buffer enabling data transfer between two clock domains with different frequencies. It uses separate write and read clocks, along with pointers to track data flow. Full and empty flags prevent overflow and underflow, while synchronization logic ensures safe transfer, avoiding metastability. Gray-coded pointers enhance reliable communication, maintaining data integrity.

## How to test

#### Set the following inputs to control FIFO operation:
 - write_enable (ui_in[0]) – Enables writing data into the FIFO.
 - read_enable (ui_in[1]) – Enables reading data from the FIFO.
 - reset (ui_in[2]) – Clears all stored data and resets the FIFO.
#### Writing to the FIFO:
  - Check if the full flag (ui_out[0]) is LOW (FIFO is not full).
 - Set write_enable (ui_in[0]) HIGH and provide data to the FIFO.
 - On the rising edge of the write clock (w_clk), data is written, and the write pointer advances.
 - Release write_enable after writing is complete.
#### Reading from the FIFO:
 - Check if the empty flag (ui_out[1]) is LOW (FIFO contains data).
 - Set read_enable (ui_in[1]) HIGH to request data.
 - On the rising edge of the read clock (r_clk), data is output, and the read pointer advances.
 - Release read_enable after reading is complete.
#### Additional Controls (if using a Debug Interface or Controller):
 - Adjust Clock Domains: Modify write and read clock frequencies to test synchronization.
 - Monitor Full/Empty Flags: Ensure proper flow control to prevent overflow or underflow.
 - Pause/Resume Reads/Writes: Dynamically enable or disable operations based on system requirements.
