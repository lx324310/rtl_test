`timescale 1ns/1ns
module fifo_tb;
wire		empty;
wire		full;
wire		halt;
wire[7:0]	dout;
reg[7:0]	din;
reg			rd;
reg			wr;
reg			rst;
reg			clr;
reg			clk;
integer		i;

fifo u0(.full(full),.empty(empty),.halt(halt),.dout(dout),.din(din),.rd(rd),.wr(wr),.rst(rst),.clr(clr),.clk(clk));

always #10 clk=~clk;
initial
begin
	i=0;
	clk=0;
	rst=0;
	clr=0;
	rd=0;
	wr=0;
	#1000;
	rst=1;
	#100;
	rst=0;
	#1000;
	clr=1;
	#100;
	clr=0;
	wr=1;
	while(!full)
	begin
		din=i;
		@(posedge clk);
		$display("wirte %d to position(%d)\n",din,u0.write_ptr);
		i=i+1;
	end
	wr=0;
	rd=1;
	while(!empty)
	begin
		@(posedge clk);
		$display("read %d form position(%d)\n",dout,u0.read_ptr);
	end
	rd=0;
	clr=0;
	i=0;
	#1000;
	wr=1;
	while(i<=3)
	begin
		din=i;
		@(posedge clk);
		$display("wirte %d to position(%d)\n",din,u0.write_ptr);
		i=i+1;
	end
	rd=1;
	while(i<=10)
	begin
		din=i;
		@(posedge clk);
		$display("wirte %d to position(%d)\n",din,u0.write_ptr);
		$display("read %d form position(%d)\n",dout,u0.read_ptr);
		i=i+1;
	end
	$finish;
end
always@(posedge clk)
begin
	if(empty && rd)
		$display("error read:operation read while fifo is empty\n");
	else if(full && wr)
		$display("error write:operation write while fifo is full\n");

end
	
initial 
	begin
		$dumpfile("../out/fifo.vcd");
		$dumpvars;
	end
endmodule

