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
// CREATED		"Fri Aug 13 20:59:22 2021"

module vedicmult_16bit(
	a,
	b,
	result
);


input wire	[15:0] a;
input wire	[15:0] b;
output wire	[31:0] result;

wire	[15:0] con_q0;
wire	[23:0] con_q2;
wire	[23:0] con_q3;
wire	[23:0] con_sum000;
wire	[15:0] q0;
wire	[15:0] q1;
wire	[15:0] q2;
wire	[15:0] q3;
wire	[31:0] result_ALTERA_SYNTHESIZED;
wire	[15:0] sum000;
wire	[23:0] SYNTHESIZED_WIRE_0;




assign	result_ALTERA_SYNTHESIZED[3] = q0[3];



vedicmult_8bit	b2v_inst(
	.a(a[7:0]),
	.b(b[7:0]),
	.result(q0));


vedicmult_8bit	b2v_inst1(
	.a(a[15:8]),
	.b(b[7:0]),
	.result(q1));

assign	result_ALTERA_SYNTHESIZED[4] = q0[4];


assign	result_ALTERA_SYNTHESIZED[5] = q0[5];


assign	result_ALTERA_SYNTHESIZED[6] = q0[6];


assign	result_ALTERA_SYNTHESIZED[7] = q0[7];


assign	result_ALTERA_SYNTHESIZED[1] = q0[1];


assign	result_ALTERA_SYNTHESIZED[0] = q0[0];



concatenate_reverse_8bit	b2v_inst16(
	.a(q3),
	.out(con_q3));
	defparam	b2v_inst16.M = 22;
	defparam	b2v_inst16.O = 28;


concatenate_8bit	b2v_inst17(
	.a(q2),
	.out(con_q2));
	defparam	b2v_inst17.M = 22;
	defparam	b2v_inst17.O = 28;


concatenate_8bit	b2v_inst18(
	.a(sum000),
	.out(con_sum000));
	defparam	b2v_inst18.M = 22;
	defparam	b2v_inst18.O = 28;


vedicmult_8bit	b2v_inst2(
	.a(a[7:0]),
	.b(b[15:8]),
	.result(q2));


vedicmult_8bit	b2v_inst3(
	.a(a[15:8]),
	.b(b[15:8]),
	.result(q3));


adder16	b2v_inst4(
	.a(con_q0),
	.b(q1),
	.sum(sum000));


adder24	b2v_inst5(
	.a(con_q2),
	.b(con_q3),
	.sum(SYNTHESIZED_WIRE_0));


adder24	b2v_inst6(
	.a(con_sum000),
	.b(SYNTHESIZED_WIRE_0),
	.sum(result_ALTERA_SYNTHESIZED[31:8]));

assign	result_ALTERA_SYNTHESIZED[2] = q0[2];



concatenate_8bit	b2v_inst9(
	.a(q0[15:8]),
	.out(con_q0));
	defparam	b2v_inst9.M = 14;
	defparam	b2v_inst9.O = 20;

assign	result = result_ALTERA_SYNTHESIZED;

endmodule
