count0:
	iverilog -o count  ../../rtl/count0/count.v ../../rtl/count0/t_ff.v  ../../bench/count_tb.v
	vvp -n count
count1:
	iverilog -o count ../../rtl/count1/count.v ../../bench/count_tb.v
	vvp -n count 
clean:
	@-rm ../out/count.vcd
	@-rm count

