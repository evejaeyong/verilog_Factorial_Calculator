module _3_to_7_decoder(d, q); //3 to 8 decoder module
	input [2:0] d; 				//input define
	output reg [6:0] q; 			//output define
	
	always@(d) begin				//if d change
		case(d)
		3'b000: q = 7'b0000001;
		3'b001: q = 7'b0000010;
		3'b010: q = 7'b0000100;
		3'b011: q = 7'b0001000;
		3'b100: q = 7'b0010000;
		3'b101: q = 7'b0100000;
		3'b110: q = 7'b1000000;
		default : q = 7'bx; //setting q value
		endcase
	end
endmodule
