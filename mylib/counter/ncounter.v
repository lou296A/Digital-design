module ncounter (
  clock, 
  enable, 
  n, 
  count
  
 );
 
 parameter BIT_SZ = 10; 
 input clock; 
 input enable; 
 input [9:0] n; 
 output [BIT_SZ-1:0] count; 
 
 reg[BIT_SZ-1:0] count; 
 
 initial count = 0; 
 
 always @ (posedge clock)
	if(enable==1'b1)
		count <= count + n; 
	
endmodule 
 