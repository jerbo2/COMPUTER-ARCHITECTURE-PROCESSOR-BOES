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
// CREATED		"Fri Aug 13 19:04:43 2021"

module vedicmult_2bit(
	a,
	b,
	result
);


input wire	[1:0] a;
input wire	[1:0] b;
output wire	[3:0] result;

wire	[3:0] result_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;




assign	result_ALTERA_SYNTHESIZED[0] = a[0] & b[0];

assign	SYNTHESIZED_WIRE_0 = a[1] & b[0];

assign	SYNTHESIZED_WIRE_1 = a[0] & b[1];

assign	SYNTHESIZED_WIRE_2 = a[1] & b[1];


HA	b2v_inst4(
	.a(SYNTHESIZED_WIRE_0),
	.b(SYNTHESIZED_WIRE_1),
	.Sum(result_ALTERA_SYNTHESIZED[1]),
	.Cout(SYNTHESIZED_WIRE_3));


HA	b2v_inst5(
	.a(SYNTHESIZED_WIRE_2),
	.b(SYNTHESIZED_WIRE_3),
	.Sum(result_ALTERA_SYNTHESIZED[2]),
	.Cout(result_ALTERA_SYNTHESIZED[3]));

assign	result = result_ALTERA_SYNTHESIZED;

endmodule
