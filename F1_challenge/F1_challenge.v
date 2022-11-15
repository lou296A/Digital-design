module F1_challenge(MAX10_CLK1_50, KEY,HEX4, HEX3, HEX2, HEX1, HEX0, LEDR);
input MAX10_CLK1_50; 
input [1:0] KEY; 
output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;//HEX5; 
output  [9:0] LEDR; 

wire tick_ms, tick_halfs;
wire [13:0] prbs; 
wire time_out; 
wire [3:0] BCD4, BCD3, BCD2, BCD1,BCD0; 
wire [3:0]BCD5, BCD6, BCD7, BCD8,BCD9;
wire  [14:0] N_out;
wire [14:0] data_2_dis; 



clktick_16 clk_ms(MAX10_CLK1_50,1'b1,16'd50000, tick_ms); 
clktick_16  clk_half(MAX10_CLK1_50,tick_ms,16'd500, tick_halfs);
F1_FSM fsm(.sysclk(tick_ms), .tick(tick_halfs), .trigger(~KEY[1]), .time_out(time_out),.en_lfsr(en_lfsr),.start_delay(start_delay),.ledr(LEDR[4:0]),.state(state)); 
lfsr14 lfsr(tick_ms,en_lfsr,prbs, data_2_dis);
delay delay(.sysclk(tick_ms), 
				.trigger(start_delay),
				.N(prbs),
				.time_out(time_out),
				.state(state0),
				.ledr(LEDR[9:5]),
				.N_out(N_out)); 


bin2bcd_16 bin2(prbs,BCD0, BCD1, BCD2, BCD3,BCD4);
bin2bcd_16 bin3(state,BCD5, BCD6, BCD7, BCD8,BCD9);
hex_to_7seg seg0(HEX0,BCD0);
hex_to_7seg seg1(HEX1,BCD1);
hex_to_7seg seg2(HEX2,BCD2);
hex_to_7seg seg3(HEX3,BCD3);
hex_to_7seg seg4(HEX4,BCD4);
//hex_to_7seg seg5(HEX5,start_delay);
endmodule 
