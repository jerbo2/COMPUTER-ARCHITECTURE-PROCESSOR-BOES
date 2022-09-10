module reg32bit(data,load,out,clock,clear);
	input [31:0]data;
	input clock;
	input clear;
	input load;
	output reg [31:0]out;
	
	initial begin
		out[31:0]<=32'b00000000000000000000000000000000;
	end 
	
	always@(posedge clock or posedge clear) begin
		
		
		if(clear == 1'b1)begin
			out <= 32'b00000000000000000000000000000000;
		end
		else begin
			case(load)
			0:out <= out;
			1:out <= data;
		endcase
		end
		
	end

endmodule 