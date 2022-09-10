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
// CREATED		"Fri Aug 13 20:19:35 2021"

module vedicmult_8bit(
	a,
	b,
	result
);


input wire	[7:0] a;
input wire	[7:0] b;
output wire	[15:0] result;

wire	[7:0] con_q0;
wire	[11:0] con_q2;
wire	[11:0] con_q3;
wire	[11:0] con_sum;
wire	[7:0] q0;
wire	[7:0] q1;
wire	[7:0] q2;
wire	[7:0] q3;
wire	[15:0] result_ALTERA_SYNTHESIZED;
wire	[7:0] sum000;
wire	[11:0] SYNTHESIZED_WIRE_0;





vedicmult_4bit	b2v_inst(
	.a(a[3:0]),
	.b(b[3:0]),
	.result(q0));


vedicmult_4bit	b2v_inst1(
	.a(a[7:4]),
	.b(b[3:0]),
	.result(q1));

assign	result_ALTERA_SYNTHESIZED[0] = q0[0];


assign	result_ALTERA_SYNTHESIZED[1] = q0[1];


assign	result_ALTERA_SYNTHESIZED[2] = q0[2];


assign	result_ALTERA_SYNTHESIZED[3] = q0[3];



concatenate_4bit	b2v_inst14(
	.a(q2),
	.out(con_q2));
	defparam	b2v_inst14.M = 14;
	defparam	b2v_inst14.O = 16;


concatenate_4bit	b2v_inst15(
	.a(sum000),
	.out(con_sum));
	defparam	b2v_inst15.M = 14;
	defparam	b2v_inst15.O = 16;


vedicmult_4bit	b2v_inst2(
	.a(a[3:0]),
	.b(b[7:4]),
	.result(q2));


vedicmult_4bit	b2v_inst3(
	.a(a[7:4]),
	.b(b[7:4]),
	.result(q3));


adder8	b2v_inst4(
	.a(con_q0),
	.b(q1),
	.sum(sum000));


adder12	b2v_inst5(
	.a(con_q2),
	.b(con_q3),
	.sum(SYNTHESIZED_WIRE_0));


adder12	b2v_inst6(
	.a(con_sum),
	.b(SYNTHESIZED_WIRE_0),
	.sum(result_ALTERA_SYNTHESIZED[15:4]));


concatenate_4bit	b2v_inst8(
	.a(q0[7:4]),
	.out(con_q0));
	defparam	b2v_inst8.M = 10;
	defparam	b2v_inst8.O = 12;


concatenate_reverse_4bit	b2v_inst9(
	.a(q3),
	.out(con_q3));
	defparam	b2v_inst9.M = 14;
	defparam	b2v_inst9.O = 16;

assign	result = result_ALTERA_SYNTHESIZED;

endmodule
