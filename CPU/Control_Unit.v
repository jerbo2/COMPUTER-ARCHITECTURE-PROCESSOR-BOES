// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
// CREATED		"Sun Aug 29 17:41:25 2021"

module Control_Unit(
	N,
	Z,
	clock,
	IR,
	ControlWordfin
);


input wire	N;
input wire	Z;
input wire	clock;
input wire	[15:0] IR;
output wire	[47:0] ControlWordfin;

wire	[47:0] CWC;
wire	[47:0] SYNTHESIZED_WIRE_0;
wire	[47:0] SYNTHESIZED_WIRE_1;
wire	[47:0] SYNTHESIZED_WIRE_2;
wire	[47:0] SYNTHESIZED_WIRE_3;





ControlUnit_decoders_together	b2v_inst(
	.N10(N),
	.Z10(Z),
	.state_reg_data(CWC[0]),
	.clock(clock),
	.IR_in_00(IR),
	.IR_in_01(IR),
	.IR_in_10(IR),
	.IR_in_11(IR),
	.ControlWordOut_00(SYNTHESIZED_WIRE_0),
	.ControlWordOut_01(SYNTHESIZED_WIRE_1),
	.ControlWordOut_10(SYNTHESIZED_WIRE_2),
	.ControlWordOut_11(SYNTHESIZED_WIRE_3));


mux_4to1_48bit_CU	b2v_inst1(
	.D00(SYNTHESIZED_WIRE_0),
	.D01(SYNTHESIZED_WIRE_1),
	.D10(SYNTHESIZED_WIRE_2),
	.D11(SYNTHESIZED_WIRE_3),
	.sel(IR[15:14]),
	.out(CWC));

assign	ControlWordfin = CWC;

endmodule
