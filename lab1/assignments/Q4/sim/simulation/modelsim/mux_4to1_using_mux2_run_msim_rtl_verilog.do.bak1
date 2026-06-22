transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab1/assignments/Q4/rtl {C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab1/assignments/Q4/rtl/mux_4to1_using_mux2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab1/assignments/Q4/rtl {C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab1/assignments/Q4/rtl/mux_2to1.v}

vlog -vlog01compat -work work +incdir+C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab1/assignments/Q4/sim/../tb {C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab1/assignments/Q4/sim/../tb/mux_4to1_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  mux_4to1_tb

add wave *
view structure
view signals
run -all
