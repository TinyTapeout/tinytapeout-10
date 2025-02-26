/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_mattvenn_level_shifter (
    input  wire       VGND,
    input  wire       VDPWR,    // 1.8v power supply
    input  wire       VAPWR,    // 3.3v power supply
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // Analog pins, only ua[5:0] can be used
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire inverted;

    sky130_fd_sc_hd__inv_2 sky130_fd_sc_hd__inv_2 (
    .A(ui_in[0]),
    .Y(inverted),
    .VNB(VGND),
    .VPB(VAPWR),
    .VPWR(VAPWR),
    .VGND(VGND)
    );
    level_shifter2 level_shifter2_0 (
    .VDD(VDPWR),
    .VDD_L(VAPWR),
    .VSS(VGND),
    .IN(inverted),
    .OUT(uo_out[0])
    );

    level_shifter2 level_shifter2_1 (
    .VDD(VDPWR),
    .VDD_L(ua[2]),
    .VSS(VGND),
    .IN(ua[1]),
    .OUT(ua[0])
    );

endmodule
