module mx2_8bit(d0, d1, s, y); //8-bits 2-to-1 mux module
	input [7:0] d0, d1;
	input s; 							//input define
	output [7:0] y; 					//output define

	mx2 U0_mx2(d0[0], d1[0], s, y[0]);
	mx2 U1_mx2(d0[1], d1[1], s, y[1]);
	mx2 U2_mx2(d0[2], d1[2], s, y[2]);
	mx2 U3_mx2(d0[3], d1[3], s, y[3]);
	mx2 U4_mx2(d0[4], d1[4], s, y[4]);
	mx2 U5_mx2(d0[5], d1[5], s, y[5]);
	mx2 U6_mx2(d0[6], d1[6], s, y[6]);
	mx2 U7_mx2(d0[7], d1[7], s, y[7]); //calculate 8bit mx2
	
endmodule
