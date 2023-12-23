module Facto_write(Addr, we, wEn); 		//write operation module
	input we;
	input [2:0] Addr; 						//input define
	output [6:0] wEn; 						//output define
	wire [6:0] w_a;
	
	_3_to_7_decoder U0(Addr, w_a);		//get decoder address
	_and2 U1(we, w_a[0], wEn[0]);
	_and2 U2(we, w_a[1], wEn[1]);
	_and2 U3(we, w_a[2], wEn[2]);
	_and2 U4(we, w_a[3], wEn[3]);
	_and2 U5(we, w_a[4], wEn[4]);
	_and2 U6(we, w_a[5], wEn[5]);
	_and2 U7(we, w_a[6], wEn[6]);			//if write enable is 1, write
endmodule
