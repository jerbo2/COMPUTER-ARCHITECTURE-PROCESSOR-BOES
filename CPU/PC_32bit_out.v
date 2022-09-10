module PC_32bit_out (clock, PS, PC_in, PC_offset, PC);
	input [1:0]PS;
	input clock;
	input [31:0] PC_in;
	input [15:0] PC_offset;
	output reg [15:0]PC;
	
	initial begin 
		PC <= 0;
	end
	
	always @(posedge clock)begin
		case (PS)
			2'b00: PC = PC;
			2'b01: PC = PC+1'b1;
			2'b10: PC = PC_in;
			2'b11: PC = PC+PC_offset;
		endcase
	end 
endmodule
	
			
	