module stack(d_in, d_out, push, pop, reset, empty, full, clock);

input [15:0]  d_in;

input push, pop, reset, clock;

output reg empty, full; // signals that determine if the stack is empty or full    

output reg [15:0] d_out;

reg [15:0] stack_mem[0:127]; // 128 deep, can be modified but must also change width of SP

reg  [6:0] SP; // stack pointer max value of 1111111 = 127

integer i;

always @ (posedge clock)

begin

    if (reset==1) begin
	 
			SP       = 7'b1000000; // reset will set SP to this value
			
			empty    = SP[6]; // reset will empty stack so empty <= 1
			
			d_out  = 4'h0;

      for (i=0;i<128;i=i+1) begin
			stack_mem[i]= 0; // clearing stack

      end

     end

  else if (reset==0) begin
  
			full = SP ? 0:1;
			
			empty  = SP[6];
			
			d_out = 16'h0000;

    if (full == 1'b0 && push == 1'b1) begin // not full and pushing

       SP            = SP-1'b1; // stack pointer decrements 

       full          = SP ? 0:1; // check if full

       empty         = SP[6];

       stack_mem[SP] = d_in; // getting data based on SP address

     end

   else if (empty == 1'b0 && pop == 1'b1) begin // not full and popping

       d_out  = stack_mem[SP]; // outputs gets stack at SP address

       stack_mem[SP] = 0; // fill address with zero

       SP  = SP+1; // stack pointer increments 

       full  = SP? 0:1; // check full

       empty  = SP[6]; // check empty

    end

   else;

  end

  else;

 end



endmodule
