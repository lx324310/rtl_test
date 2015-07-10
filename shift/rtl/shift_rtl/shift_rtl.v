module shift(data_out,data_in,shift,right,arith);
output[31:0] data_out;
input[31:0]  data_in;
input[4:0]   shift;
input		 right;
//arith=1 arith shift arith=0 logic shift
input		 arith;
wire		 sign=data_in[31]&arith;
wire[15:0]   high16={16{sign}};
wire[31:0]	 data_sl16,data_sl8,data_sl4,data_sl2,data_sl1;
wire[31:0]	 data_sr16,data_sr8,data_sr4,data_sr2,data_sr1;
wire[31:0]	 data_s16 ,data_s8 ,data_s4 ,data_s2 ,data_s1 ;
wire[31:0]	 data_r16 ,data_r8 ,data_r4 ,data_r2;
//shift 16
assign data_sl16={data_in[15:0],16'b0};
assign data_sr16={high16,data_in[31:16]};
mux32 u16(.out(data_s16),.a(data_sr16),.b(data_sl16),.sel(right));
mux32 us0(.out(data_r16),.a(data_s16),.b(data_in),.sel(shift[4]));
//shift 8
assign data_sl8={data_r16[23:0],8'b0};
assign data_sr8={high16[7:0],data_r16[31:8]};
mux32 u8(.out(data_s8),.a(data_sr8),.b(data_sl8),.sel(right));
mux32 us1(.out(data_r8),.a(data_s8),.b(data_r16),.sel(shift[3]));
//shift 4
assign data_sl4={data_r8[27:0],4'b0};
assign data_sr4={high16[3:0],data_r8[31:4]};
mux32 u4(.out(data_s4),.a(data_sr4),.b(data_sl4),.sel(right));
mux32 us2(.out(data_r4),.a(data_s4),.b(data_r8),.sel(shift[2]));
//shift 2
assign data_sl2={data_r4[29:0],2'b0};
assign data_sr2={high16[1:0],data_r4[31:2]};
mux32 u2(.out(data_s2),.a(data_sr2),.b(data_sl2),.sel(right));
mux32 us3(.out(data_r2),.a(data_s2),.b(data_r4),.sel(shift[1]));
//shift 1
assign data_sl1={data_r2[30:0],1'b0};
assign data_sr1={high16[0],data_r16[31:1]};
mux32 u1(.out(data_s1),.a(data_sr1),.b(data_sl1),.sel(right));
mux32 us4(.out(data_out),.a(data_s1),.b(data_r2),.sel(shift[0]));
endmodule

module mux32(out,a,b,sel);
output[31:0] out;
input[31:0]  a;
input[31:0]  b;
input		 sel;

assign out=sel?a:b;

endmodule
