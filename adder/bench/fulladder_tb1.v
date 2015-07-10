`timescale 1ns/1ns
module fulladder_tb;
reg[3:0] a,b;
reg	cin;
reg	clk;
wire[3:0] sum;
wire[4:0] sum_all;
wire cout;
fulladder4 u0(.sum(sum),.cout(cout),.a(a),.b(b),.cin(cin),.clk(clk));
reg[4:0] a0,b0;
reg[1:0] cin0;
assign sum_all={cout,sum};
always #10 clk=~clk;
initial 
begin
	clk=0;
	for(cin0=0;cin0<=1'b1;cin0=cin0+1)
	begin
		cin=cin0[0];
		for(a0=5'b0;a0<=5'b1111;a0=a0+1)
		begin
			a=a0[3:0];
			for(b0=5'b0;b0<=5'b1111;b0=b0+1)
			begin	
				b=b0[3:0];
				@(negedge clk);
			end
		end
	end
	$finish;
end

initial
begin
	$dumpfile("../out/fulladder.vcd");
	$dumpvars;
end
endmodule

