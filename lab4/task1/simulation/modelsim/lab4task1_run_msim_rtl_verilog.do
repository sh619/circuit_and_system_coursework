transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/E2_circuit_system/lab4/task1 {C:/E2_circuit_system/lab4/task1/counter_4.v}

