module _inv(a, y);			//NOT gate Module
	input a;						//input define
	output y;					//output define
	
	assign y = ~a;				//Use NOT gate

endmodule						//NOT gate Module end

module _and2(a, b, y);		//2-input AND gate Module
	input a, b;					//input define
	output y;					//output define
	
	assign y = a & b;			//Use AND gate
	
endmodule						//AND gate Module end

module _nand2(a, b, y);		//2-input NAND gate Module
	input a, b;					//input define
	output y;					//output define
	
	assign y = ~(a & b);		//Use AND, NOT gate -> NAND
	
endmodule						//NAND gate Module end

module _or2(a, b, y);		//2-input OR gate Module
	input a, b;					//input define
	output y;					//output define
	
	assign y = a | b;			//Use OR gate
	
endmodule						//OR gate Module end

module _xor2(a, b, y);		//2-input XOR gate Module
	input a, b;					//input define
	output y;					//output define
	
	_inv not1(a, na);			//Use NOT gate
	_inv not2(b, nb);			//Use NOT gate
	_and2 and21(a, nb, w0);	//Use AND gate
	_and2 and22(na, b, w1);	//Use AND gate
	_or2 or21(w0, w1, y);	//Use OR gate
	
endmodule						//XOR gate Module end

module _and3(a, b, c, y);	//3-input AND gate Module

	input a, b, c;				//input define
	output y;					//output define
	assign y = a & b & c;	//Use AND gate

endmodule						//3-input AND gate Module end

module _and4(a, b, c, d, y);		//4-input AND gate Module

	input a, b, c, d;					//input define
	output y;							//output define
	assign y = a & b & c & d;		//Use AND gate

endmodule								//4-input AND gate Module end

module _and5(a, b, c, d, e, y);	//5-input AND gate Module

	input a, b, c, d, e;				//input define
	output y;							//output define
	assign y = a & b & c & d & e;	//Use AND gate

endmodule								//5-input AND gate Module end

module _or3(a, b, c, y);			//3-input OR gate Module
	
	input a, b, c;						//input define
	output y;							//output define
	assign y = a | b | c;			//Use OR gate

endmodule								//3-input OR gate Module end

module _or4(a, b, c, d, y);		//4-input OR gate Module

	input a, b, c, d;					//input define
	output y;							//output define
	assign y = a | b | c | d;		//Use OR gate
	
endmodule								//4-input OR gate Module end

module _or5(a, b, c, d, e, y);	//5-input OR gate Module

	input a, b, c, d, e;				//input define
	output y;							//output define
	assign y = a | b | c | d | e;	//Use OR gate

endmodule								//5-input OR gate Module end


module _inv_4bits(a, y); 			//4bits invertor Module

	input [3:0] a; 					//input define
	output [3:0] y; 					//output define
	assign y=~a;						//Use invertor

endmodule 								//4bits invertor Module end

module _and2_4bits(a, b, y); 		//4bits 2-input AND gate Module

	input [3:0] a, b; 				//input define
	output [3:0] y;					//output define
	assign y = a & b;					//Use AND gate

endmodule 								//4bits 2-input AND gate Module end

module _or2_4bits(a, b, y); 		//4bits 2-input OR gate Module
	
	input [3:0] a, b; 				//input define
	output [3:0] y; 					//output define
	assign y = a | b;					//Use OR gate

endmodule 								//4bits 2-input OR gate Module end

module _xor2_4bits(a, b, y); 		//4bits 2-input XOR gate Module

	input [3:0] a, b; 				//input define
	output [3:0] y; 					//output define

	_xor2 U0_xor2(a[0], b[0], y[0]);
	_xor2 U1_xor2(a[1], b[1], y[1]);
	_xor2 U2_xor2(a[2], b[2], y[2]);
	_xor2 U3_xor2(a[3], b[3], y[3]);	//Use XOR gate

endmodule 								//4bits 2-input XOR gate Module end

module _xnor2_4bits(a, b, y); 	//4bits 2-input XNOR gate Module
	input [3:0] a, b; 				//input define
	output [3:0] y; 					//output define
	wire [3:0] w0;						//wire define

	_xor2_4bits U0_xor2_4bits(a, b, w0);	//Use XOR gate
	_inv_4bits U1_inv_4bits(w0, y);			//Use invertor

endmodule 								//4bits 2-input XNOR gate Module End

module _inv_32bits(a, y); 			//32bits invertor Module

	input [31:0] a; 					//input define
	output [31:0] y; 					//output define
	assign y=~a;						//Use invertor

endmodule								//32bits invertor Module end

module _and2_32bits(a, b, y); 	//32bits 2-input AND gate Module

	input [31:0] a,b; 				//input define
	output [31:0] y; 					//output define
	assign y = a & b;					//Use AND gate

endmodule 								//32bits 2-input AND gate Module End

module _or2_32bits(a, b, y);		//32bits 2-input OR gate Module

	input [31:0] a,b; 				//input define
	output [31:0] y; 					//output define
	assign y = a | b;					//Use OR gate

endmodule 								//32bits 2-input OR gate Module End

module _xor2_32bits(a, b, y); 	//32bits 2-input XOR gate Module
	input [31:0] a, b; 				//input define
	output [31:0] y; 					//output define

	_xor2_4bits U0_xor2_4bits(a[3:0], b[3:0], y[3:0]);
	_xor2_4bits U1_xor2_4bits(a[7:4], b[7:4], y[7:4]);
	_xor2_4bits U2_xor2_4bits(a[11:8], b[11:8], y[11:8]);
	_xor2_4bits U3_xor2_4bits(a[15:12], b[15:12], y[15:12]);
	_xor2_4bits U4_xor2_4bits(a[19:16], b[19:16], y[19:16]);
	_xor2_4bits U5_xor2_4bits(a[23:20], b[23:20], y[23:20]);
	_xor2_4bits U6_xor2_4bits(a[27:24], b[27:24], y[27:24]);
	_xor2_4bits U7_xor2_4bits(a[31:28], b[31:28], y[31:28]);	//Use XOR gate

endmodule 								//32bits 2-input XOR gate Module End

module _xnor2_32bits(a, b, y); 	//32bits 2-input XNOR gate Module
	input [31:0] a, b; 				//input define
	output [31:0] y; 					//output define

	_xnor2_4bits U0_xnor2_4bits(a[3:0], b[3:0], y[3:0]);
	_xnor2_4bits U1_xnor2_4bits(a[7:4], b[7:4], y[7:4]);
	_xnor2_4bits U2_xnor2_4bits(a[11:8], b[11:8], y[11:8]);
	_xnor2_4bits U3_xnor2_4bits(a[15:12], b[15:12], y[15:12]);
	_xnor2_4bits U4_xnor2_4bits(a[19:16], b[19:16], y[19:16]);
	_xnor2_4bits U5_xnor2_4bits(a[23:20], b[23:20], y[23:20]);
	_xnor2_4bits U6_xnor2_4bits(a[27:24], b[27:24], y[27:24]);
	_xnor2_4bits U7_xnor2_4bits(a[31:28], b[31:28], y[31:28]);	//Use XNOR gate

endmodule 								//32bits 2-input XNOR gate Module End