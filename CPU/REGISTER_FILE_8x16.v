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
// CREATED		"Thu Aug 19 23:48:39 2021"

module REGISTER_FILE_8x16(
	reset,
	clock,
	WR,
	AA,
	BA,
	D,
	DA,
	A,
	B,
	R0,
	R1,
	R2,
	R3,
	R4,
	R5,
	R6,
	R7
);


input wire	reset;
input wire	clock;
input wire	WR;
input wire	[2:0] AA;
input wire	[2:0] BA;
input wire	[31:0] D;
input wire	[2:0] DA;
output wire	[31:0] A;
output wire	[31:0] B;
output wire	[31:0] R0;
output wire	[31:0] R1;
output wire	[31:0] R2;
output wire	[31:0] R3;
output wire	[31:0] R4;
output wire	[31:0] R5;
output wire	[31:0] R6;
output wire	[31:0] R7;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_32;
wire	[31:0] SYNTHESIZED_WIRE_33;
wire	[31:0] SYNTHESIZED_WIRE_34;
wire	[31:0] SYNTHESIZED_WIRE_35;
wire	[31:0] SYNTHESIZED_WIRE_36;
wire	[31:0] SYNTHESIZED_WIRE_37;
wire	[31:0] SYNTHESIZED_WIRE_38;
wire	[31:0] SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;

assign	R0 = SYNTHESIZED_WIRE_32;
assign	R1 = SYNTHESIZED_WIRE_33;
assign	R2 = SYNTHESIZED_WIRE_34;
assign	R3 = SYNTHESIZED_WIRE_35;
assign	R4 = SYNTHESIZED_WIRE_36;
assign	R5 = SYNTHESIZED_WIRE_37;
assign	R6 = SYNTHESIZED_WIRE_38;
assign	R7 = SYNTHESIZED_WIRE_39;




decoder	b2v_inst(
	.select(DA),
	.o0(SYNTHESIZED_WIRE_1),
	.o1(SYNTHESIZED_WIRE_2),
	.o2(SYNTHESIZED_WIRE_3),
	.o3(SYNTHESIZED_WIRE_4),
	.o4(SYNTHESIZED_WIRE_5),
	.o5(SYNTHESIZED_WIRE_6),
	.o6(SYNTHESIZED_WIRE_7),
	.o7(SYNTHESIZED_WIRE_8));


reg32bit	b2v_inst10(
	.load(SYNTHESIZED_WIRE_0),
	.clock(clock),
	.clear(reset),
	.data(D),
	.out(SYNTHESIZED_WIRE_39));

assign	SYNTHESIZED_WIRE_23 = WR & SYNTHESIZED_WIRE_1;

assign	SYNTHESIZED_WIRE_22 = WR & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_21 = WR & SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_20 = WR & SYNTHESIZED_WIRE_4;

assign	SYNTHESIZED_WIRE_19 = WR & SYNTHESIZED_WIRE_5;

assign	SYNTHESIZED_WIRE_18 = WR & SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_9 = WR & SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_0 = WR & SYNTHESIZED_WIRE_8;


reg32bit	b2v_inst19(
	.load(SYNTHESIZED_WIRE_9),
	.clock(clock),
	.clear(reset),
	.data(D),
	.out(SYNTHESIZED_WIRE_38));


special_mux3to8	b2v_inst2(
	.R0(SYNTHESIZED_WIRE_32),
	.R1(SYNTHESIZED_WIRE_33),
	.R2(SYNTHESIZED_WIRE_34),
	.R3(SYNTHESIZED_WIRE_35),
	.R4(SYNTHESIZED_WIRE_36),
	.R5(SYNTHESIZED_WIRE_37),
	.R6(SYNTHESIZED_WIRE_38),
	.R7(SYNTHESIZED_WIRE_39),
	.select(BA),
	.out(B));


reg32bit	b2v_inst20(
	.load(SYNTHESIZED_WIRE_18),
	.clock(clock),
	.clear(reset),
	.data(D),
	.out(SYNTHESIZED_WIRE_37));


reg32bit	b2v_inst21(
	.load(SYNTHESIZED_WIRE_19),
	.clock(clock),
	.clear(reset),
	.data(D),
	.out(SYNTHESIZED_WIRE_36));


reg32bit	b2v_inst22(
	.load(SYNTHESIZED_WIRE_20),
	.clock(clock),
	.clear(reset),
	.data(D),
	.out(SYNTHESIZED_WIRE_35));


reg32bit	b2v_inst23(
	.load(SYNTHESIZED_WIRE_21),
	.clock(clock),
	.clear(reset),
	.data(D),
	.out(SYNTHESIZED_WIRE_34));


reg32bit	b2v_inst24(
	.load(SYNTHESIZED_WIRE_22),
	.clock(clock),
	.clear(reset),
	.data(D),
	.out(SYNTHESIZED_WIRE_33));


reg32bit	b2v_inst25(
	.load(SYNTHESIZED_WIRE_23),
	.clock(clock),
	.clear(reset),
	.data(D),
	.out(SYNTHESIZED_WIRE_32));


special_mux3to8	b2v_inst9(
	.R0(SYNTHESIZED_WIRE_32),
	.R1(SYNTHESIZED_WIRE_33),
	.R2(SYNTHESIZED_WIRE_34),
	.R3(SYNTHESIZED_WIRE_35),
	.R4(SYNTHESIZED_WIRE_36),
	.R5(SYNTHESIZED_WIRE_37),
	.R6(SYNTHESIZED_WIRE_38),
	.R7(SYNTHESIZED_WIRE_39),
	.select(AA),
	.out(A));


endmodule
