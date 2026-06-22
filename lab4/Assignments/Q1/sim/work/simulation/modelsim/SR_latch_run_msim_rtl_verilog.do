transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab4/Assignments/Q1/rtl {C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab4/Assignments/Q1/rtl/SR_latch.v}

vlog -vlog01compat -work work +incdir+C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab4/Assignments/Q1/sim/work/../../tb {C:/Users/Naveenraj/OneDrive/Documents/Maven_silicon_Verilog_labs/lab4/Assignments/Q1/sim/work/../../tb/SR_latch_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  SR_latch_tb

add wave *
view structure
view signals
run -all
