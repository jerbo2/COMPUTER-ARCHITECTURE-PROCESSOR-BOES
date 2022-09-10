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
// CREATED		"Sun Aug 29 17:33:32 2021"

module ControlUnit_decoders_together(
	N10,
	Z10,
	clock,
	state_reg_data,
	IR_in_00,
	IR_in_01,
	IR_in_10,
	IR_in_11,
	ControlWordOut_00,
	ControlWordOut_01,
	ControlWordOut_10,
	ControlWordOut_11
);


input wire	N10;
input wire	Z10;
input wire	clock;
input wire	state_reg_data;
input wire	[15:0] IR_in_00;
input wire	[15:0] IR_in_01;
input wire	[15:0] IR_in_10;
input wire	[15:0] IR_in_11;
output wire	[47:0] ControlWordOut_00;
output wire	[47:0] ControlWordOut_01;
output wire	[47:0] ControlWordOut_10;
output wire	[47:0] ControlWordOut_11;

wire	[47:0] CW0;
wire	[47:0] CW1;
wire	[47:0] CW2;
wire	[47:0] CW3;
wire	[15:0] IR0;
wire	[15:0] IR1;
wire	[15:0] IR2;
wire	[15:0] IR3;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_3;

assign	SYNTHESIZED_WIRE_3 = 1;




CPU_Decoder00	b2v_inst(
	.State(SYNTHESIZED_WIRE_5),
	.IR(IR0),
	.IR_L(CW0[45]),
	.WR(CW0[35]),
	.Clr(CW0[34]),
	.Cin(CW0[28]),
	.MuxA(CW0[21]),
	.MemWrite(CW0[4]),
	.NS(CW0[0]),
	.AA(CW0[44:42]),
	.BA(CW0[41:39]),
	.DA(CW0[38:36]),
	.FS(CW0[33:29]),
	.K(CW0[20:5]),
	.MuxD(CW0[27:22]),
	.PS(CW0[47:46]),
	.SC(CW0[3:1]));


CPU_Decoder10_new	b2v_inst1(
	.N(N10),
	.Z(Z10),
	.State(SYNTHESIZED_WIRE_5),
	.IR(IR2),
	.IR_L(CW2[45]),
	.WR(CW2[35]),
	.Clr(CW2[34]),
	.Cin(CW2[28]),
	.MuxA(CW2[21]),
	.MemWrite(CW2[4]),
	.NS(CW2[0]),
	.AA(CW2[44:42]),
	.BA(CW2[41:39]),
	.DA(CW2[38:36]),
	.FS(CW2[33:29]),
	.K(CW2[20:5]),
	.MuxD(CW2[27:22]),
	.PS(CW2[47:46]),
	.SC(CW2[3:1]));


CPU_Decoder11	b2v_inst11(
	.State(SYNTHESIZED_WIRE_5),
	.IR(IR3),
	.IR_L(CW3[45]),
	.WR(CW3[35]),
	.Clr(CW3[34]),
	.Cin(CW3[28]),
	.MuxA(CW3[21]),
	.MW(CW3[4]),
	.NS(CW3[0]),
	.AA(CW3[44:42]),
	.BA(CW3[41:39]),
	.DA(CW3[38:36]),
	.FS(CW3[33:29]),
	.K(CW3[20:5]),
	.MuxD(CW3[27:22]),
	.PS(CW3[47:46]),
	.SC(CW3[3:1]));


register	b2v_inst5(
	.data(state_reg_data),
	.load(SYNTHESIZED_WIRE_3),
	.clock(clock),
	.out(SYNTHESIZED_WIRE_5));



CPU_Decoder01	b2v_inst7(
	.State(SYNTHESIZED_WIRE_5),
	.IR(IR1),
	.IR_L(CW1[45]),
	.WR(CW1[35]),
	.Clr(CW1[34]),
	.Cin(CW1[28]),
	.MuxA(CW1[21]),
	.MemWrite(CW1[4]),
	.NS(CW1[0]),
	.AA(CW1[44:42]),
	.BA(CW1[41:39]),
	.DA(CW1[38:36]),
	.FS(CW1[33:29]),
	.K(CW1[20:5]),
	.MuxD(CW1[27:22]),
	.PS(CW1[47:46]),
	.SC(CW1[3:1]));

assign	ControlWordOut_00 = CW0;
assign	IR0 = IR_in_00;
assign	ControlWordOut_01 = CW1;
assign	IR1 = IR_in_01;
assign	ControlWordOut_10 = CW2;
assign	IR2 = IR_in_10;
assign	ControlWordOut_11 = CW3;
assign	IR3 = IR_in_11;

endmodule
