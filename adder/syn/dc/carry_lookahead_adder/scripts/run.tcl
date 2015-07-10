analyze -format verilog  {../../../rtl/carry_lookahead_adder/fulladder4.v ../../../rtl/carry_lookahead_adder/gp_gen.v}
elaborate fulladder4
link
uniquify
check_design
source ./scripts/carry_lookahead_adder.con
compile
report_timing > ./mapped/timing.rpt
report_area > ./mapped/area.rpt
report_power > ./mapped/power.rpt
write -format ddc -hierarchy -output ./mapped/fulladder.ddc
exit
