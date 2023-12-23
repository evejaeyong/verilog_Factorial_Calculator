module register64_r_1(clk, reset_n, d, q); 			//64bits Resettable Filp-Flop Module
	input clk, reset_n;
	input [63:0] d; 											//input define
	output reg [63:0] q; 									//output define
	
	always@(posedge clk or negedge reset_n) begin	//clock is rising edge and reset_n is falling edge
		if(reset_n == 0) q <= 64'b1;
		else q <= d;
	end
	
endmodule
