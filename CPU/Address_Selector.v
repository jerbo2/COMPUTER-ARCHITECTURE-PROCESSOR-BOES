module Address_Selector(ADD, Q, RAM_S);
	input [11:0]ADD;
	output  reg [11:0]Q;
	output reg RAM_S;
	
	always @(ADD) begin
		if (ADD[11:0]<12) begin
			RAM_S<=1'b0;
		end 
		else begin
			RAM_S<=1'b1;
		end
		case (ADD[11:0])
			12'h000: 	Q<=12'b000000000001;
			12'h001: 	Q<=12'b000000000010;
			12'h002: 	Q<=12'b000000000100;
			12'h003: 	Q<=12'b000000001000;
			12'h004: 	Q<=12'b000000010000;
			12'h005: 	Q<=12'b000000100000;
			12'h006: 	Q<=12'b000001000000;
			12'h007: 	Q<=12'b000010000000;
			12'h008: 	Q<=12'b000100000000;
			12'h009: 	Q<=12'b001000000000;
			12'h00a: 	Q<=12'b010000000000;
			12'h00b: 	Q<=12'b100000000000;
		endcase
	end
endmodule
			