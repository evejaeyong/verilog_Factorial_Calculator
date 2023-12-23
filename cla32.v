module cla32(a, b, ci, s, co);	//32bits CLA module
	input [31:0] a, b;
	input ci; 			//input define
	
	output [31:0] s;
	output co; 			//output define
	
	wire [6:0] carry;
	
	cla4 U0(a[3:0], b[3:0], ci, s[3:0], carry[0]);
	cla4 U1(a[7:4], b[7:4], carry[0], s[7:4], carry[1]);
	cla4 U2(a[11:8], b[11:8], carry[1], s[11:8], carry[2]);
	cla4 U3(a[15:12], b[15:12], carry[2], s[15:12], carry[3]);
	cla4 U4(a[19:16], b[19:16], carry[3], s[19:16], carry[4]);
	cla4 U5(a[23:20], b[23:20], carry[4], s[23:20], carry[5]);
	cla4 U6(a[27:24], b[27:24], carry[5], s[27:24], carry[6]);
	cla4 U7(a[31:28], b[31:28], carry[6], s[31:28], co);			//Instance 4bits CLA module
	
endmodule
