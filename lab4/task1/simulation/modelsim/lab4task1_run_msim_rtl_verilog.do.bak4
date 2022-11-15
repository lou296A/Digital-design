transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/E2_CAS/lab3/task2 {C:/E2_CAS/lab3/task2/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+C:/E2_CAS/lab4/task1 {C:/E2_CAS/lab4/task1/counter_4.v}
vlog -vlog01compat -work work +incdir+C:/E2_CAS/lab4/task1 {C:/E2_CAS/lab4/task1/lab4task1.v}

