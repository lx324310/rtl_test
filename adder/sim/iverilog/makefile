carry_lookahead_adder:
	iverilog -o fulladder ../../rtl/carry_lookahead_adder/gp_gen.v ../../rtl/carry_lookahead_adder/fulladder4.v ../../bench/fulladder_tb0.v
	vvp  fulladder
pipeline_adder:
	iverilog -o fulladder ../../rtl/pipeline_adder/fulladder1.v ../../rtl/pipeline_adder/fulladder4.v ../../bench/fulladder_tb1.v
	vvp  fulladder
ripple_carry_adder:
	iverilog -o fulladder ../../rtl/ripple_carry_adder/fulladder1.v ../../rtl/ripple_carry_adder/fulladder4.v ../../bench/fulladder_tb0.v
	vvp  fulladder
clean:
	@-rm ../out/fulladder.vcd
	@-rm fulladder
