module fifo(full,empty,halt,dout,din,rd,wr,rst,clr,clk);
output		full;
output		empty;
output		halt;
output[7:0]	dout;
input[7:0]	din;
input		rd;
input		wr;
input		rst;
input		clr;
input		clk;
reg[7:0]	mem[15:0];
reg[3:0]	cnt;
reg[3:0]	read_ptr,write_ptr;
reg[7:0]	dout;
always@(posedge clk or posedge rst)
begin
	if(rst)
	begin
		cnt<=4'b0;
		read_ptr<=4'b0;
		write_ptr<=4'b0;
	end
	else if(clr)
	begin
		cnt<=4'b0;
		read_ptr<=4'b0;
		write_ptr<=4'b0;
	end
	else 
		case({rd,wr})
			2'b10:
				begin	
					if(!empty)
					begin
						dout<=mem[read_ptr];
						read_ptr<=(read_ptr==4'b1111)?4'b0:(read_ptr+1'b1);
						cnt<=cnt-1'b1;
					end
				end
			2'b01:
				begin
					if(!full)
					begin
						mem[write_ptr]<=din;	
						write_ptr<=(write_ptr==4'b1111)?4'b0:(write_ptr+1'b1);
						cnt<=cnt+1'b1;
					end
				end
			2'b11:
				begin 
					mem[write_ptr]<=din;
					write_ptr<=(write_ptr==4'b1111)?4'b0:(write_ptr+1'b1);
					read_ptr<=(read_ptr==4'b1111)?4'b0:(read_ptr+1'b1);
					dout<=mem[read_ptr];
				end
		endcase
end
assign full=(cnt==4'b1111);
assign empty=(cnt==4'b0);
assign halt=(cnt==4'b111);
endmodule
