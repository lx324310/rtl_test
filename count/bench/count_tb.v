`timescale 1ns/1ns
module count_tb;
wire[3:0] cnt;
reg clk;
reg reset;
//module define
count u0(.cnt(cnt),
	 .clk(clk),
	 .reset(reset));
//signal define
initial
	begin
		clk<=1'b0;
		reset<=1'b0;
		#1000;
		reset<=1'b1;
		#1000;
		reset<=1'b0;
		#10000;
		$finish;
	end
always #10 clk<=~clk;
//desiplay and save wave
initial
	begin
		$monitor($time,"\treset=%b,count=%d;\n",reset,cnt);
	end
initial 
	begin
		$dumpfile("../out/count.vcd");
		$dumpvars(0,count_tb.u0);
	end
endmodule
