module concatenate(a, out);
	

	parameter M = 8;
	parameter O = 8;
	
	input [M-7:0]a;
	output [O-5:0]out;
	
	
	assign out = {2'b00, a};

endmodule

module concatenate_reverse(a, out);
	

	parameter M = 8;
	parameter O = 8;
	
	input [M-7:0]a;
	output [O-5:0]out;
	
	
	assign out = {a, 2'b00};

endmodule

///////////////////////////////////

module concatenate_4bit(a, out);
	

	parameter M = 8;
	parameter O = 8;
	
	input [M-7:0]a;
	output [O-5:0]out;
	
	
	assign out = {4'b0000, a};

endmodule

module concatenate_reverse_4bit(a, out);
	

	parameter M = 8;
	parameter O = 8;
	
	input [M-7:0]a;
	output [O-5:0]out;
	
	
	assign out = {a, 4'b0000};

endmodule

///////////////////////////////////

module concatenate_8bit(a, out);
	

	parameter M = 8;
	parameter O = 8;
	
	input [M-7:0]a;
	output [O-5:0]out;
	
	
	assign out = {8'b00000000, a};

endmodule

module concatenate_reverse_8bit(a, out);
	

	parameter M = 8;
	parameter O = 8;
	
	input [M-7:0]a;
	output [O-5:0]out;
	
	
	assign out = {a, 8'b00000000};

endmodule

///////////////////////////////////
module concatenate_16bit_z(a, out);
	

	parameter M = 16;
	parameter O = 32;
	
	input [M-1:0]a;
	output [O-1:0]out;
	
	
	assign out = {16'b0000000000000000, a};

endmodule


module big_concatenator (stack_in, PC_in, rom_in, stack_out, PC_out, rom_out);
	input [15:0]stack_in, PC_in, rom_in;
	output [31:0]stack_out, PC_out, rom_out;
	
	assign stack_out = {16'b0000000000000000, stack_in}; 
	assign PC_out = {16'b0000000000000000, PC_in};
	assign rom_out = {16'b0000000000000000, rom_in};
	
endmodule


	
	
	