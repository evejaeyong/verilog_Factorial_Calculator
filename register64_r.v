module register64_r(clk, reset_n, d, q);				//64bits resettable D Flip-Flop
	input clk, reset_n;
	input [63:0] d;											//input define
	output reg [63:0] q;										//output define
	
	always@ (posedge clk or negedge reset_n) begin	//clock is rising edge and reset_n is falling edge
		if(~reset_n) q <= 64'b0;
		else q <= d;
	end

endmodule
