analyze -format verilog  ../../rtl/fifo.v 
elaborate fifo
link
uniquify
check_design
source ./scripts/fifo.con
compile
report_timing > ./mapped/timing.rpt
report_area > ./mapped/area.rpt
report_power > ./mapped/power.rpt
write -format ddc -hierarchy -output ./mapped/fifo.ddc
exit
