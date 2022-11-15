transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/E2_CAS/mylib {C:/E2_CAS/mylib/pwm.v}
vlog -vlog01compat -work work +incdir+C:/E2_CAS/mylib/to {C:/E2_CAS/mylib/to/spi2dac.v}
vlog -vlog01compat -work work +incdir+C:/E2_CAS/mylib/to {C:/E2_CAS/mylib/to/hex_to_7seg.v}
vlog -vlog01compat -work work +incdir+C:/E2_CAS/mylib/to {C:/E2_CAS/mylib/to/bin2bcd_16.v}
vlog -vlog01compat -work work +incdir+C:/E2_CAS/mylib/counter {C:/E2_CAS/mylib/counter/clktick_16.v}
vlog -vlog01compat -work work +incdir+C:/E2_CAS/lab5/lab5task3 {C:/E2_CAS/lab5/lab5task3/lab5task3.v}
vlog -vlog01compat -work work +incdir+C:/E2_CAS/mylib/counter {C:/E2_CAS/mylib/counter/ncounter.v}

