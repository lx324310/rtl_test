analyze -format verilog  ../../../rtl/count1/count.v
elaborate count
link
uniquify
check_design
source ./scripts/count.con
compile
report_timing > ./mapped/timing.rpt
report_area > ./mapped/area.rpt
report_power > ./mapped/power.rpt
write -format ddc -hierarchy -output ./mapped/count.ddc
#compile_ultra -gate_clock -no_autoungroup
#report_power > ./mapped/power_with_clkgate.rpt
#write -format ddc -hierarchy -output ./mapped/count_gate.ddc
exit
