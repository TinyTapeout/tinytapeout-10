/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_oscillating_bones (
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

  wire osc_out_internal_3v3;
  wire osc_out;
  wire osc_div_2;
  wire osc_div_4;
  wire osc_div_8;
  wire osc_out_3v3;

  ring ring (.ROSC_OUT(osc_out_internal_3v3));

  skullfet_inverter_5v_pwr level_shift (
      .VDD(VDPWR),
      .A  (osc_out_internal_3v3),
      .Y  (osc_out)
  );

  freq_divider divider (
      .IN(osc_out),
      .ODIV2(osc_div_2),
      .ODIV4(osc_div_4),
      .ODIV8(osc_div_8)
  );

  skullfet_inverter_5v_pwr ua_buffer (
      .VDD(VAPWR),
      .A  (osc_out),
      .Y  (osc_out_3v3)
  );

  assign uo_out[0] = osc_out;
  assign uo_out[1] = osc_div_2;
  assign uo_out[2] = osc_div_4;
  assign uo_out[3] = osc_div_8;
  assign uo_out[4] = VGND;
  assign uo_out[5] = VGND;
  assign uo_out[6] = VGND;
  assign uo_out[7] = VGND;

  assign uio_out[0] = VGND;
  assign uio_out[1] = VGND;
  assign uio_out[2] = VGND;
  assign uio_out[3] = VGND;
  assign uio_out[4] = VGND;
  assign uio_out[5] = VGND;
  assign uio_out[6] = VGND;
  assign uio_out[7] = VGND;

  assign uio_oe[0] = VGND;
  assign uio_oe[1] = VGND;
  assign uio_oe[2] = VGND;
  assign uio_oe[3] = VGND;
  assign uio_oe[4] = VGND;
  assign uio_oe[5] = VGND;
  assign uio_oe[6] = VGND;
  assign uio_oe[7] = VGND;

  assign ua[0] = osc_out_3v3;

endmodule
