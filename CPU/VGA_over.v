module VGA_over(out, address); //10
    output reg[15:0] out;
    input [7:0] address; //address- 8 deep memory
    
	 // This program will cycle through 12 bits of RGB color by loading select bits into
	 // different register file registers and storing them in address 0 (color_config register)
	 // an address selector will (in this case) always chose address zero which outputs 
	 // 12'b000000000001 which is ANDed with MW (mem write). If that is true, write is enabled
	 // Although the address stored into is 0, the address selector takes that zero and outputs a 1
	 // meaning the SFR color_config is actually mapped to a 12-bit 1.If both address and write are
	 // 1, color_config <= data. For the color to actually be seen a clock divider is required 
	 // or else you'll just see vertical / diagonal colored lines.
	
	 // Order of color: White -- Red -- Orange -- Yellow -- Green -- Blue -- Indigo -- Violet
	 
	 // This program could be easily modified to show combinations of colors or simply a white screen.
	 
    always @(address) begin
        case(address)
		
		8'h00:  out = 16'b1100000000001111; // LRI R0, 15 = Red
	
		8'h01:  out = 16'b1101100011110000; // LRI R3, 240 = Green
		
		8'h02:  out = 16'b1110100011111111; // LRI R5, 255 // Load 11111111 into R5
		
		8'h03:  out = 16'b0100011100101101; // NOT R4, R5   // Setting bits for Blue
		
		  
		8'h04:  out = 16'b1010100000000000; // STI R0, 0  // Storing Red
		
		
		8'h05:  out = 16'b0110010001001001; // STI R3, 0  // Storing Green
		
		8'h06:  out = 16'b0110010001001001; // STI R3, 0  // Storing Green
	
		8'h07:  out = 16'b1011100111111110; // STI R3, 0  // Storing Green
		
	
		8'h08:  out = 16'b1010100000000000; // STI R3, 0  // Storing Green
		
		
		8'h09:  out = 16'b0110010001001001; // STI R3, 0  // Storing Green
		
		8'h0a:  out = 16'b0110010001001001; // STI R3, 0  // Storing Green
	
		8'h0b:  out = 16'b1011100111111110; // STI R3, 0  // Storing Green
	
		8'h0c:  out = 16'b1001101000000000; // NOT R4, R5
		
							
		
				default: out = 16'b0000000000000000; //NOP
        endcase
    end
endmodule // rom_case