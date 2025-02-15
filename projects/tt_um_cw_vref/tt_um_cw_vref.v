/*
 * Copyright (c) 2024 Christoph Weiser
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_cw_vref (
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


wire [2:0] uio_hv ;
wire [7:0] ui_in_hv ;
wire vbg ;
wire vsw ;
wire iout ;
wire vbuf ;


bandgap
xbg ( 
 .vdd( VAPWR ),
 .vss( VGND ),
 .en( uio_hv[2] ),
 .trim( ui_in_hv ),
 .vbg( vbg ),
 .iout( iout )
);


testbuffer
xtb ( 
 .vdd( VAPWR ),
 .vss( VGND ),
 .bias( ua[2] ),
 .in( vsw ),
 .out( vbuf )
);


spdt
xsw1 ( 
 .vdd( VAPWR ),
 .vss( VGND ),
 .en( uio_hv[0] ),
 .ina( ua[1] ),
 .inb( vbg ),
 .out( vsw )
);


spdt
xsw2 ( 
 .vdd( VAPWR ),
 .vss( VGND ),
 .en( uio_hv[1] ),
 .ina( vbuf ),
 .inb( iout ),
 .out( ua[0] )
);


levelshifter
xlvl1_7 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( ui_in[7] ),
 .out( ui_in_hv[7] )
);


levelshifter
xlvl1_6 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( ui_in[6] ),
 .out( ui_in_hv[6] )
);


levelshifter
xlvl1_5 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( ui_in[5] ),
 .out( ui_in_hv[5] )
);


levelshifter
xlvl1_4 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( ui_in[4] ),
 .out( ui_in_hv[4] )
);


levelshifter
xlvl1_3 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( ui_in[3] ),
 .out( ui_in_hv[3] )
);


levelshifter
xlvl1_2 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( ui_in[2] ),
 .out( ui_in_hv[2] )
);


levelshifter
xlvl1_1 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( ui_in[1] ),
 .out( ui_in_hv[1] )
);


levelshifter
xlvl1_0 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( ui_in[0] ),
 .out( ui_in_hv[0] )
);


levelshifter
xlvl2_2 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( uio_in[2] ),
 .out( uio_hv[2] )
);


levelshifter
xlvl2_1 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( uio_in[1] ),
 .out( uio_hv[1] )
);


levelshifter
xlvl2_0 ( 
 .vddh( VAPWR ),
 .vddl( VDPWR ),
 .vss( VGND ),
 .in( uio_in[0] ),
 .out( uio_hv[0] )
);


// Grounded as per instruction
assign uo_out[1] = VGND;
assign uo_out[2] = VGND;
assign uo_out[3] = VGND;
assign uo_out[4] = VGND;
assign uo_out[5] = VGND;
assign uo_out[6] = VGND;
assign uo_out[7] = VGND;

// Grounded as per instruction
assign uio_out[0] = VGND;
assign uio_out[1] = VGND;
assign uio_out[2] = VGND;
assign uio_out[3] = VGND;
assign uio_out[4] = VGND;
assign uio_out[5] = VGND;
assign uio_out[6] = VGND;
assign uio_out[7] = VGND;

// Make all uio IO inputs
assign uio_oe[0] = VGND;
assign uio_oe[1] = VGND;
assign uio_oe[2] = VGND;
assign uio_oe[3] = VGND;
assign uio_oe[4] = VGND;
assign uio_oe[5] = VGND;
assign uio_oe[6] = VGND;
assign uio_oe[7] = VGND;

endmodule
