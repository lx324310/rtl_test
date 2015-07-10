module fulladder4(output[3:0] sum,
				  output cout,
				  input[3:0] a,
				  input[3:0] b,
				  input cin);
wire[3:0] cout0;
assign cout=cout0[3];
fulladder1 u0(sum[0],cout0[0],a[0],b[0],cin);
fulladder1 u1(sum[1],cout0[1],a[1],b[1],cout0[0]);
fulladder1 u2(sum[2],cout0[2],a[2],b[2],cout0[1]);
fulladder1 u3(sum[3],cout0[3],a[3],b[3],cout0[2]);
endmodule

