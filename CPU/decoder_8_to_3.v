module decoder3to8(in0, in1, in2, out0, out1, out2, out3, out4, out5, out6, out7 ); 


input in0, in1, in2;  

output reg out0, out1, out2, out3, out4, out5, out6, out7; 

   

always @ (in2,in1,in0) 

begin 

	out0=0;
	out1=0;
	out2=0;
	out3=0;
	out4=0;
	out5=0;
	out6=0;
	out7=0; 

 begin 

 case ({in2,in1,in0}) 

	3'b000: out0=1; 
	3'b001: out1=1; 
	3'b010: out2=1; 
	3'b011: out3=1; 
	3'b100: out4=1; 
	3'b101: out5=1; 
	3'b110: out6=1; 
	3'b111: out7=1; 

 default: begin 

	out0=0;
	out1=0;
	out2=0;
	out3=0;
	out4=0;
	out5=0;
	out6=0;
	out7=0; 

  end 

  endcase 

 end 

end

endmodule