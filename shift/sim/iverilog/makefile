shift_rtl:
	iverilog -o shift ../../rtl/shift_rtl/shift_rtl.v ../../bench/shift_tb.v
	vvp -n shift
shift_func:
	iverilog -o shift ../../rtl/shift_func/shift_func.v ../../bench/shift_tb.v
	vvp -n shift
clean:
	@-rm ../out/shift.vcd
	@-rm shift
