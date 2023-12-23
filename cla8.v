module cla8(a, b, ci, s, co);	//32bits CLA module
	input [7:0] a, b;
	input ci; 			//input define
	output [7:0] s;
	output co; 			//output define
	
	cla4 U0(a[3:0], b[3:0], ci, s[3:0], carry);
	cla4 U1(a[7:4], b[7:4], carry, s[7:4], co);		//Instance 4bits CLA module
	
endmodule
