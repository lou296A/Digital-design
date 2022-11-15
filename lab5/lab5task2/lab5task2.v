module lab5task2
(MAX10_CLK1_50, 
SW
, HEX0
, HEX1
, HEX2
, HEX3
, HEX4
,PWM_OUT
 ,DAC_SDI
 ,DAC_CS 
 ,DAC_SCK

);


input MAX10_CLK1_50;
input [9:0] SW;
output [6:0] HEX0; 
output [6:0] HEX1;
output [6:0] HEX2;
output [6:0] HEX3;  
output [6:0] HEX4;
output  DAC_SDI,DAC_CS ,DAC_SCK ; 
wire tick;
output PWM_OUT; 
wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;

clktick_16  cliktick(MAX10_CLK1_50,1, 16'd1000,tick); 

pwm pwm_1(MAX10_CLK1_50, SW[9:0] , tick, 10'd999,PWM_OUT) ; 

bin2bcd_16 bin2bcd(SW, BCD0, BCD1, BCD2, BCD3, BCD4); 
hex_to_7seg seg0(HEX0,BCD0); 
hex_to_7seg seg1(HEX1,BCD1); 
hex_to_7seg seg2(HEX2,BCD2); 
hex_to_7seg seg3(HEX3,BCD3); 
hex_to_7seg seg4(HEX4,BCD4); 
spi2dac spi0(MAX10_CLK1_50,SW[9:0],tick, DAC_SDI, DAC_CS, DAC_SCK ); 
endmodule 
