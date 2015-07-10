module t_ff(output	q,
	    	input	clk,
			input	reset);
reg	q;
wire	d;
assign d=~q;
always@(negedge clk or posedge reset)
	if(reset)
		q<=1'b0;
	else
		q<=d;
endmodule
