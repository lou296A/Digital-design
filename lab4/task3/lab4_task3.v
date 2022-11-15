module lab4_task3(HEX0,HEX1,HEX2,HEX3,HEX4,HEX5, KEY); 
output [6:0] HEX0;
output [6:0] HEX1; 
output [6:0] HEX2; 
output [6:0] HEX3;
output [6:0] HEX4;
output [6:0] HEX5;
input [1:0] KEY;
wire [6:0] data_out;
wire [3:0] bcd0;
wire [3:0] bcd1;
wire [3:0] bcd2;
wire [3:0] bcd3;
wire [3:0] bcd4;


lfsr7 shift(data_out, KEY[1]); 
bin2bcd_16 decimalconv({9'b00000000,data_out}, bcd0, bcd1, bcd2, bcd3, bcd4);
hex_to_7seg seg0(HEX0, bcd0); 
hex_to_7seg seg1(HEX1, bcd1); 
hex_to_7seg seg2(HEX2, bcd2);
endmodule 


