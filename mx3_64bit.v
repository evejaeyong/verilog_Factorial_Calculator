module mx3_64bit(d0, d1, d2, s, y); //64bits 3-to-1 mux module
	input [63:0] d0, d1, d2;
	input [1:0] s;							//input define
	
	output [63:0] y;						//output define
	
	wire [63:0] w;							//wire define
	
	mx2_64bit U0(d0, d1, s[1], w);
	mx2_64bit U1(w, d2, s[0], y);		//instance mx2_64bit

endmodule
