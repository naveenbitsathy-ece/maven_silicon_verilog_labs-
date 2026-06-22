transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab2/rtl {C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab2/rtl/alu.v}

