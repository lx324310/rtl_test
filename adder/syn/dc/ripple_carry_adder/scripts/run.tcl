analyze -format verilog  {../../../rtl/ripple_carry_adder/fulladder4.v ../../../rtl/ripple_carry_adder/fulladder1.v}
elaborate fulladder4
link
uniquify
check_design
source ./scripts/ripple_carry_adder.con
compile
report_timing > ./mapped/timing.rpt
report_area > ./mapped/area.rpt
report_power > ./mapped/power.rpt
write -format ddc -hierarchy -output ./mapped/fulladder.ddc
exit
