module Facto_read(Addr, Data, from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6);
										//read operation module
	input [63:0] from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6;
	input [2:0] Addr; 			//input define
	output [63:0] Data; 			//output define
	
	_7_to_1_MUX U0(from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5, from_reg6, Addr, Data);
										//setting Data using 7-to-1 MUX
endmodule
