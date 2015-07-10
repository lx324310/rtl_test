module shift(data_out,data_in,shift,right,arith);
output[31:0] data_out;
input[31:0]  data_in;
input[4:0]   shift;
input		 right;
reg[31:0]	 data_out;
//arith=1 arith shift arith=0 logic shift
input		 arith;
always@*
	if(!right)
		data_out<=data_in<<shift;
	else if(!arith)
		data_out<=data_in>>shift;
	else
		data_out<=$signed(data_in)>>>shift;
endmodule

