	

`timescale 1ns / 100ps

module clktick_16(
	clock, 
	enable,
	tick
); 
	input enable; 
	input clock;
	output tick; 
	reg tick;
	reg[15:0] count; 
 

	initial count = 0; 
	always @ (posedge clock)
	if(enable == 1'b1)
		if  (count ==16'b1100001101001111) begin
			tick <= 1'b1; 
			count <= 0;
			end 
		else begin 
			tick <= 0;
			count <= count + 1'b1; 
		
			end 
	

	
	
endmodule 