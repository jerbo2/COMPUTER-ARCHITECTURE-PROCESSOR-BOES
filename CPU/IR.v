module IR (clock, load, D_in, D_out);
	parameter n = 16;
	input clock, load;
	input [n-1:0]D_in;
	output reg [n-1:0]D_out;
	
	initial D_out <= 16'b0110000000000000;

	always @ (posedge clock) begin
			if(load) begin
			D_out <= D_in;
		end
	end
endmodule


			
	