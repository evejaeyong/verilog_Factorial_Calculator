module mx2(d0, d1, s, y); 	//1-bit 2-to-1 mux module
	input d0, d1, s; 			//input define
	output y; 					//output define

	_inv U0_inv(s, sb);
	_nand2 U1_nand2(d0, sb, w0);
	_nand2 U2_nand2(d1, s, w1);
	_nand2 U3_nand2(w0, w1, y); //calculate mx2
endmodule
