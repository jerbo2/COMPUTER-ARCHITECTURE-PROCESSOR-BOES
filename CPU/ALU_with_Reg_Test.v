module ALU_with_Reg_Test(MAX10_CLK1_50, GPIO, GPIO1_D, KEY, SW, LEDR);
	input MAX10_CLK1_50;
	input [1:0] KEY;
	input [9:0] SW;
	input [9:0] LEDR;
	output [31:0] GPIO;
	inout [31:0] GPIO1_D;
	
	assign GPIO1_D = 32'bz;
	
	
	wire [31:0] sw_led;
	
	wire clockme;
	assign clockme = KEY[0];
	
	wire write_sig;
	assign write_sig = SW[0];
	
	wire reset_sig;
	assign reset_sig = KEY[1];
	
	
	wire overflow_flag;
	assign overflow_flag = LEDR[0];
	
	wire carry_flag;
	assign carry_flag = LEDR[1];
	
	wire neg_flag;
	assign neg_flag = LEDR[2];
	
	wire zero_flag;
	assign zero_flag = LEDR[3];
	
	
	wire GPIO_clock;
	assign GPIO_clock = MAX10_CLK1_50;
	
	wire A_bus;
	wire B_bus;
	assign A_bus = LEDR[9];
	assign B_bus = LEDR[8];
	
	// use a subset of the 32-bit counter to generate data to be displayed
	// on the matrix display
	wire [15:0]R0, R1, R2, R3, R4, R5, R6, R7;
	assign R0 = R0;
	assign R1 = R1;
	assign R2 = R2;
	assign R3 = R3;
	assign R4 = R4;
	assign R5 = R5;
	assign R6 = R6;
	assign R7 = R7;
	
	// alternate between even and odd decimal points being on based on count[27]
	wire HEX0_DP, HEX1_DP, HEX2_DP, HEX3_DP, HEX4_DP, HEX5_DP, HEX6_DP, HEX7_DP;
	assign HEX0_DP = 0;
	assign HEX1_DP = 1;
	assign HEX2_DP = 0;
	assign HEX3_DP = 1;
	assign HEX4_DP = 0;
	assign HEX5_DP = 1;
	assign HEX6_DP = 0;
	assign HEX7_DP = 1;
	
	wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
	wire [4:0] S;
	wire [2:0] DA, AA, BA;
	wire [15:0] D;
	
	
	assign HEX0 = S;
	assign S = SW[9:5];
	assign HEX1 = DA;
	assign HEX2 = AA;
	assign HEX3 = BA;
	assign HEX4 = 1'h3;
	assign HEX5 = 1'h4;
	assign HEX6 = 1'h5;
	assign HEX7 = 1'h6;


	
	wire filler;
	
	
	
	wire [31:0]sw, led;

	assign led[15:0] = sw[31:16];
	assign led[31:16] = sw[15:0];
	

	GPIO_Board4 DUT(
	GPIO_clock,
	R0, R1, R2, R3, R4, R5, R6, R7, 
	HEX0, HEX0_DP, HEX1, HEX1_DP, 
	HEX2, HEX2_DP, HEX3, HEX3_DP, 
	HEX4, HEX4_DP, HEX5, HEX5_DP, 
	HEX6, HEX6_DP, HEX7, HEX7_DP, sw, led, GPIO, GPIO1_D);
	
	reg8x16 REG1(
	.WR (write_sig),
	.clock (clockme),
	.reset (reset_sig),
	.AA (AA),
	.BA (BA),
	.D (filler),
	.DA (HEX1),
	.A (A_bus),
	.B (B_bus),
	.R0 (R0),
	.R1 (R1),
	.R2 (R2),
	.R3 (R3),
	.R4 (R4),
	.R5 (R5),
	.R6 (R6),
	.R7 (R7)
);

	ALU_16bit_Complete ALU1(
	.S (HEX0),
	.A (filler),
	.B (filler),
	.F (filler),
	.V (overflow_flag),
	.C (carry_flag),
	.N (neg_flag),
	.Z (zero_flag)
	);


	
	

endmodule
