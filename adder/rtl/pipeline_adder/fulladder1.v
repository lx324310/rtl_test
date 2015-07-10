module fulladder1(output sum,
				  output cout,
				  input a,
				  input b,
				  input cin
				 );
assign sum=a^b^cin;
assign cout=a&b | a&cin | b&cin;
endmodule
