module register3_r(clk, reset_n, d, q);				//Async Resettable 3bits D Flip-Flop Module
	input clk, reset_n;
	input [2:0] d;												//input define
	output reg [2:0] q;										//output define
	
	always @(posedge clk or negedge reset_n) begin	//when clk is 1
		if (reset_n == 0) q <= 3'b0;
		else q <= d;
	end
	
endmodule
