module ALU_16bit_Complete(
	input [4:0] S,
	input [31:0]A,
	input [31:0]B,
	input Cin,
	output [31:0] F,
	output V,
	output C,
	output N,
	output Z
	);
	
wire [4:0] FS = S[4:0];
wire [31:0] ALU_Result;

ALU_final ALU1(
	.FS(FS[4:0]),
	.Cin (Cin),
	.A(A[31:0]),
	.B(B[31:0]),
	.ALU_Result(ALU_Result[31:0]),
	.V(V),
	.C(C)			);
	

	
assign N = ALU_Result[31];
assign Z = ~|ALU_Result;
assign F = ALU_Result;
				
endmodule
	
	
	