module mx2_64bit(d0, d1, s, y); //64bits 2-to-1 mux module
	input [63:0] d0, d1;
	input s; 							//input define
	output [63:0] y; 					//output define
	
	mx2_8bit U0(d0[7:0], d1[7:0], s, y[7:0]);
	mx2_8bit U1(d0[15:8], d1[15:8], s, y[15:8]);
	mx2_8bit U2(d0[23:16], d1[23:16], s, y[23:16]);
	mx2_8bit U3(d0[31:24], d1[31:24], s, y[31:24]);
	mx2_8bit U4(d0[39:32], d1[39:32], s, y[39:32]);
	mx2_8bit U5(d0[47:40], d1[47:40], s, y[47:40]);
	mx2_8bit U6(d0[55:48], d1[55:48], s, y[55:48]);
	mx2_8bit U7(d0[63:56], d1[63:56], s, y[63:56]);	//calculate 64bit mx2
	
endmodule
