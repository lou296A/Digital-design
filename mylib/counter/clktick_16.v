	

`timescale 1ns / 100ps

module clktick_16(	
	clock, 
	enable,
	N, 
	tick

); 

	input enable; 
	input clock;
	input [15:0] N; 
	output tick; 
	reg tick;
	reg[15:0] count; 
 

	initial count = 0; 
	always @ (posedge clock)
	if(enable == 1'b1)
		if  (count == 0) begin
			tick <= 1'b1; 
			count <= N;
			end 
		else begin 
			tick <= 1'b0;
			count <= count - 1'b1; 
		
			end 	
	
endmodule 