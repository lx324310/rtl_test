module count(	output[3:0] cnt,
		input	clk,
		input	reset);

t_ff t0(cnt[0],clk,reset);
t_ff t1(cnt[1],cnt[0],reset);
t_ff t2(cnt[2],cnt[1],reset);
t_ff t3(cnt[3],cnt[2],reset);

endmodule
