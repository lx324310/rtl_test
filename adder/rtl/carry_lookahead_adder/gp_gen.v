module gp_gen(cout,a,b,cin);
output[4:0] cout;
input[3:0]	a;
input[3:0]	b;
input		cin;
wire[3:0] g,p;
assign g=a & b;
assign p=a | b;
assign cout[0]=cin;
assign cout[1]=g[0]|(p[0]&cout[0]);
assign cout[2]=g[1]|(p[1]&g[0])|(p[1]&p[0]&cout[0]);
assign cout[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cout[0]);
assign cout[4]=g[3]|(p[3]&g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cout[0]);
endmodule

