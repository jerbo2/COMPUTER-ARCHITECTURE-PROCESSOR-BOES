module vga_top_for_proc(
	input clk, write,
	input [11:0]data, address,
	output Hsync,
	output Vsync,
	output [3:0] Red,
	output [3:0] Green,
	output [3:0] Blue
	);
	
parameter ADDRESS_COLOR_CONFIG = 12'h000;

reg [11:0]color_config;
wire clk_25;
wire enable_V_Counter;
wire [15:0] H_Count_value;
wire [15:0] V_Count_value;
wire red_switch0, red_switch1, red_switch2, red_switch3;
wire green_switch0, green_switch1, green_switch2, green_switch3;
wire blue_switch0, blue_switch1, blue_button0, blue_button1;
wire [3:0] red_switches, green_switches, blue_switches;

wire color_config_address;

assign color_config_address = (address == ADDRESS_COLOR_CONFIG) ? 1'b1 : 1'b0;

clock_divider VGA_clock_gen (clk, clk_25);
horizontal_counter VGA_H (clk_25, enable_V_Counter, H_Count_value);
vertical_counter VGA_V (clk_25, enable_V_Counter, V_Count_value);

assign red_switch0 = color_config[0];
assign red_switch1 = color_config[1];
assign red_switch2 = color_config[2];
assign red_switch3 = color_config[3];

assign green_switch0 = color_config[4];
assign green_switch1 = color_config[5];
assign green_switch2 = color_config[6];
assign green_switch3 = color_config[7];

assign blue_switch0 = color_config[8];
assign blue_switch1 = color_config[9];
assign blue_button0 = color_config[10];
assign blue_button1 = color_config[11];

assign red_switches = {red_switch0, red_switch1, red_switch2, red_switch3}; 
assign green_switches = {green_switch0, green_switch1, green_switch2, green_switch3};
assign blue_switches = {blue_switch0, blue_switch1, blue_button0, blue_button1};

	initial begin 
		color_config <= 12'hFFF;
	end
	
	always @ (posedge clk) begin
		if (write && color_config_address) color_config <= data;
		else color_config <= color_config;
	end


assign Hsync = (H_Count_value < 96) ? 1'b1: 1'b0;
assign Vsync = (V_Count_value < 2) ? 1'b1: 1'b0;

assign Red = (H_Count_value < 784 && H_Count_value > 143 && V_Count_value < 515 && V_Count_value > 34) ? red_switches : 4'h0;
assign Green = (H_Count_value < 784 && H_Count_value > 143 && V_Count_value < 515 && V_Count_value > 34) ? green_switches : 4'h0;	
assign Blue = (H_Count_value < 784 && H_Count_value > 143 && V_Count_value < 515 && V_Count_value > 34) ? blue_switches : 4'h0;

endmodule
	
