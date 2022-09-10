module mux_4to1_48bit_CU(D00, D01, D10, D11, sel, out);
	input	[47:0]D00;	
	input [47:0]D01; 
	input [47:0]D10; 
	input [47:0]D11;
	input [1:0]sel;		
			
	output reg [47:0]out;	
	
	always @* begin 
		case(sel)
			2'b00:out=D00;
			2'b01:out=D01;
			2'b10:out=D10;
			2'b11:out=D11;
		endcase 
	end
endmodule 