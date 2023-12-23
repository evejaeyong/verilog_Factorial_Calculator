module fa_v2(a, b, ci, s);		//Full Adder Module
	input a, b, ci;				//input define
	output s;						//output define
	
	_xor2 xor21(a, b, w0);		//Use XOR gate
	_xor2 xor22(w0, ci, s);		//Use XOR gate
	
endmodule							//Full Adder Module End
