module clb4(a, b, ci, c1, c2, c3, co);	//carry look-ahead block module
	input [3:0] a, b;							//input define
	input ci;
	output c1, c2, c3, co;					//output define
	
	wire [3:0] g, p;							//wire define
	wire w0_c1;
	wire w0_c2, w1_c2;
	wire w0_c3, w1_c3, w2_c3;
	wire w0_co, w1_co, w2_co, w3_co;
	// G
	_and2 and21(a[0], b[0], g[0]);		//use AND gate module
	_and2 and22(a[1], b[1], g[1]);
	_and2 and23(a[2], b[2], g[2]);
	_and2 and24(a[3], b[3], g[3]);
	// P
	_or2 or21(a[0], b[0], p[0]);			//use OR gate module
	_or2 or22(a[1], b[1], p[1]);
	_or2 or23(a[2], b[2], p[2]);
	_or2 or24(a[3], b[3], p[3]);

	
	
	_and2 and25(p[0], ci, w0_c1);
	_or2 or25(g[0], w0_c1, c1);								// c1
	
	_and2 and26(p[1], g[0], w0_c2);
	_and3 and31(p[1], p[0], ci, w1_c2);
	_or3 or31(g[1], w0_c2, w1_c2, c2);						// c2

	_and2 and27(p[2], g[1], w0_c3);
	_and3 and32(p[2], p[1], g[0], w1_c3);
	_and4 and41(p[2], p[1], p[0], ci, w2_c3);
	_or4 or41(g[2], w0_c3, w1_c3, w2_c3, c3);				// c3
	
	
	_and2 and28(p[3], g[2], w0_co);
	_and3 and33(p[3], p[2], g[1], w1_co);
	_and4 and42(p[3], p[2], p[1], g[0], w2_co);
	_and5 and51(p[3], p[2], p[1], p[0], ci, w3_co);
	_or5 or51(g[3], w0_co, w1_co, w2_co, w3_co, co);	// co
	
endmodule 
