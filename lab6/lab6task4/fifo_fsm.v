module fifo_fsm(sysclk, full, fifo_state); 
input sysclk; 
input full;  
output  fifo_state; 
reg fifo_state; 

always @(posedge sysclk)
 if(full == 1) fifo_state <= 1; 
endmodule 
