analyze -format verilog  ../../../rtl/shift_rtl/shift_rtl.v 
elaborate shift
link
uniquify
check_design
source ./scripts/shift.con
compile
report_timing > ./mapped/timing.rpt
report_area > ./mapped/area.rpt
report_power > ./mapped/power.rpt
write -format ddc -hierarchy -output ./mapped/shift.ddc
exit
