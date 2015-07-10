`timescale 1ns/1ns
module shift_tb;
wire[31:0] data_out;
reg[31:0]  data_in;
reg[4:0]   shift;
reg		   right;
reg		   arith;
//module define
shift u0(.data_out(data_out),.data_in(data_in),.shift(shift),.right(right),.arith(arith));
//generate input signal
reg[1:0] arith_r,right_r;
reg[6:0] shift_r;
initial
begin
	data_in<=32'b1010_1010_1010_1010_1010_1010_1010_1010;
	for(arith_r=2'b0;arith_r<=2'b1;arith_r=arith_r+1)
	begin
		arith<=arith_r[0];
		for(right_r=2'b0;right_r<=2'b1;right_r=right_r+1)
		begin
			right<=right_r[0];
			for(shift_r=6'b0;shift_r<=6'b11111;shift_r=shift_r+1'b1)
			begin
				shift<=shift_r[4:0];
				$display("\tdata_out=%b,shift=%b,arith=%b,right=%b,data_in=%b\n",data_out,shift,arith,right,data_in);
				#100;
				data_in<=32'b1010_1010_1010_1010_1010_1010_1010_1010;
			end
		end
	end
end

initial 
begin
	$dumpfile("../out/shift.vcd");
	$dumpvars;
end
endmodule

