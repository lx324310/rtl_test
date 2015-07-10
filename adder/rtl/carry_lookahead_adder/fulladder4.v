module fulladder4(sum,cout,a,b,cin);
output[3:0] sum;
output		cout;
input[3:0]	a;
input[3:0]	b;
input		cin;
wire[4:0] cout0;
assign	cout=cout0[4];
gp_gen u0(.cout(cout0),.a(a),.b(b),.cin(cin));
assign sum=a^b^cout0[3:0];
endmodule
