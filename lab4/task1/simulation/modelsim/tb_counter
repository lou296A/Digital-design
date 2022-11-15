add wave clock enable reset 
add wave -hexadecimal count 
force clock 0 0, 1 10ns -repeat 20ns 
force reset 0
force enable 1 
run 100ns 
force enable 0
run 100ns 
force reset 1 
run 100ns 
force reset 0
force enable 1 
run 600ns 