module cla64(a, b, ci, s, co);		//128bits CLA module
	input [63:0] a, b;
	input ci; 			//input define
	
	output [63:0] s;
	output co; 			//output define
	
	cla32 U0(a[31:0], b[31:0], ci, s[31:0], carry);
	cla32 U1(a[63:32], b[63:32], carry, s[63:32], co);		//Instance 32bit CLA module

endmodule
