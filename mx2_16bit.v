module mx2_16bit(d0, d1, s, y); //16bits 2-to-1 mux module
	input [15:0] d0, d1;
	input s; 							//input define
	output [15:0] y; 					//output define

	mx2_8bit U0(d0[7:0], d1[7:0], s, y[7:0]);
	mx2_8bit U1(d0[15:8], d1[15:8], s, y[15:8]);		//module instance
	
endmodule
