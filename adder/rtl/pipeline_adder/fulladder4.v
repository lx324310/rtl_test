module fulladder4(sum,cout,a,b,cin,clk);
output[3:0] sum;
output		cout;
input[3:0]	a;
input[3:0]	b;
input		cin;
input		clk;
reg[3:0] sum;
reg		 cout;
reg a0_reg,b0_reg,cin_reg;
reg a1_reg0,a1_reg1,b1_reg0,b1_reg1;
reg a2_reg0,a2_reg1,a2_reg2,b2_reg0,b2_reg1,b2_reg2;
reg a3_reg0,a3_reg1,a3_reg2,a3_reg3,b3_reg0,b3_reg1,b3_reg2,b3_reg3;
reg cout_reg0,cout_reg1,cout_reg2;
reg sum0_reg0,sum0_reg1,sum0_reg2;
reg sum1_reg0,sum1_reg1;
reg sum2_reg0;
wire sum0_wire,sum1_wire,sum2_wire,sum3_wire;
wire cout_wire0,cout_wire1,cout_wire2,cout_wire3;
//pipeline 1
always@(posedge clk)
	begin
		a0_reg<=a[0];
		b0_reg<=b[0];
		a1_reg0<=a[1];
		b1_reg0<=b[1];
		a2_reg0<=a[2];
		b2_reg0<=b[2];
		a3_reg0<=a[3];
		b3_reg0<=b[3];
		cin_reg<=cin;
	end
fulladder1 u0(sum0_wire,cout_wire0,a0_reg,b0_reg,cin_reg);
//pipeline 2
always@(posedge clk)
	begin
		a1_reg1<=a1_reg0;
		b1_reg1<=b1_reg0;
		a2_reg1<=a2_reg0;
		b2_reg1<=b2_reg0;
		a3_reg1<=a3_reg0;
		b3_reg1<=b3_reg0;
		cout_reg0<=cout_wire0;
		sum0_reg0<=sum0_wire;
	end
fulladder1 u1(sum1_wire,cout_wire1,a1_reg1,b1_reg1,cout_reg0);
//pipeline 3
always@(posedge clk)
	begin
		a2_reg2<=a2_reg1;
		b2_reg2<=b2_reg1;
		a3_reg2<=a3_reg1;
		b3_reg2<=b3_reg1;
		cout_reg1<=cout_wire1;
		sum1_reg0<=sum1_wire;
		sum0_reg1<=sum0_reg0;
	end
fulladder1 u2(sum2_wire,cout_wire2,a2_reg2,b2_reg2,cout_reg1);
//pipeline 4
always@(posedge clk)
	begin
		a3_reg3<=a3_reg2;
		b3_reg3<=b3_reg2;
		cout_reg2<=cout_wire2;
		sum2_reg0<=sum2_wire;
		sum1_reg1<=sum1_reg0;
		sum0_reg2<=sum0_reg1;
	end
fulladder1 u3(sum3_wire,cout_wire3,a3_reg3,b3_reg3,cout_reg2);
//pipeline 5
always@(posedge clk)
	begin
		cout<=cout_wire3;
		sum[3]<=sum3_wire;
		sum[2]<=sum2_reg0;
		sum[1]<=sum1_reg1;
		sum[0]<=sum0_reg2;
	end

endmodule
