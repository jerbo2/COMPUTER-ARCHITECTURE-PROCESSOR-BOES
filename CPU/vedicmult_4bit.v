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
// CREATED		"Fri Aug 13 19:37:26 2021"

module vedicmult_4bit(
	a,
	b,
	result
);


input wire	[3:0] a;
input wire	[3:0] b;
output wire	[7:0] result;

wire	out0;
wire	out1;
wire	out2;
wire	out20;
wire	out21;
wire	out22;
wire	out23;
wire	out24;
wire	out25;
wire	out3;
wire	out30;
wire	out31;
wire	out32;
wire	out33;
wire	out34;
wire	out35;
wire	[5:0] out4;
wire	[3:0] q0;
wire	[3:0] q1;
wire	[3:0] q2;
wire	[3:0] q3;
wire	[7:0] result_ALTERA_SYNTHESIZED;
wire	[3:0] sum00;
wire	[5:0] SYNTHESIZED_WIRE_0;

wire	[5:0] GDFX_TEMP_SIGNAL_2;
wire	[5:0] GDFX_TEMP_SIGNAL_4;
wire	[5:0] GDFX_TEMP_SIGNAL_1;
wire	[5:0] GDFX_TEMP_SIGNAL_5;
wire	[3:0] GDFX_TEMP_SIGNAL_0;
wire	[3:0] GDFX_TEMP_SIGNAL_3;


assign	out35 = GDFX_TEMP_SIGNAL_2[5];
assign	out34 = GDFX_TEMP_SIGNAL_2[4];
assign	out33 = GDFX_TEMP_SIGNAL_2[3];
assign	out32 = GDFX_TEMP_SIGNAL_2[2];
assign	out31 = GDFX_TEMP_SIGNAL_2[1];
assign	out30 = GDFX_TEMP_SIGNAL_2[0];

assign	GDFX_TEMP_SIGNAL_4 = {out35,out34,out33,out32,out31,out30};
assign	out25 = GDFX_TEMP_SIGNAL_1[5];
assign	out24 = GDFX_TEMP_SIGNAL_1[4];
assign	out23 = GDFX_TEMP_SIGNAL_1[3];
assign	out22 = GDFX_TEMP_SIGNAL_1[2];
assign	out21 = GDFX_TEMP_SIGNAL_1[1];
assign	out20 = GDFX_TEMP_SIGNAL_1[0];

assign	GDFX_TEMP_SIGNAL_5 = {out25,out24,out23,out22,out21,out20};
assign	out3 = GDFX_TEMP_SIGNAL_0[3];
assign	out2 = GDFX_TEMP_SIGNAL_0[2];
assign	out1 = GDFX_TEMP_SIGNAL_0[1];
assign	out0 = GDFX_TEMP_SIGNAL_0[0];

assign	GDFX_TEMP_SIGNAL_3 = {out3,out2,out1,out0};


vedicmult_2bit	b2v_inst(
	.a(a[1:0]),
	.b(b[1:0]),
	.result(q0));


vedicmult_2bit	b2v_inst1(
	.a(a[3:2]),
	.b(b[1:0]),
	.result(q1));


concatenate	b2v_inst11(
	.a(q0[3:2]),
	.out(GDFX_TEMP_SIGNAL_0));
	defparam	b2v_inst11.M = 8;
	defparam	b2v_inst11.O = 8;


concatenate	b2v_inst12(
	.a(sum00),
	.out(GDFX_TEMP_SIGNAL_1));
	defparam	b2v_inst12.M = 10;
	defparam	b2v_inst12.O = 10;


concatenate	b2v_inst13(
	.a(q2),
	.out(GDFX_TEMP_SIGNAL_2));
	defparam	b2v_inst13.M = 10;
	defparam	b2v_inst13.O = 10;

assign	result_ALTERA_SYNTHESIZED[1] = q0[1];


assign	result_ALTERA_SYNTHESIZED[0] = q0[0];



concatenate_reverse	b2v_inst18(
	.a(q3),
	.out(out4));
	defparam	b2v_inst18.M = 10;
	defparam	b2v_inst18.O = 10;


vedicmult_2bit	b2v_inst2(
	.a(a[1:0]),
	.b(b[3:2]),
	.result(q2));


vedicmult_2bit	b2v_inst3(
	.a(a[3:2]),
	.b(b[3:2]),
	.result(q3));


adder4	b2v_inst4(
	.a(q1),
	.b(GDFX_TEMP_SIGNAL_3),
	.sum(sum00));


adder6	b2v_inst5(
	.a(GDFX_TEMP_SIGNAL_4),
	.b(out4),
	.sum(SYNTHESIZED_WIRE_0));


adder6	b2v_inst6(
	.a(GDFX_TEMP_SIGNAL_5),
	.b(SYNTHESIZED_WIRE_0),
	.sum(result_ALTERA_SYNTHESIZED[7:2]));

assign	result = result_ALTERA_SYNTHESIZED;

endmodule
