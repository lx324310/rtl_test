module count(cnt,clk,reset);
output[3:0] cnt;
input clk;
input reset;
reg[3:0] cnt;
always@(negedge clk or posedge reset)
	if(reset)
		cnt<=4'b0;
	else
		cnt<=cnt+1;
endmodule
