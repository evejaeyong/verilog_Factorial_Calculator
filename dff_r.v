module dff_r(clk, reset_n, d, q);						//Async Resettable D Flip-Flop Module
	input clk, reset_n, d;									//input define
	output reg q;												//output define
	
	always @(posedge clk or negedge reset_n) begin	//when clk is 1
		if (reset_n == 0) q <= 1'b0;
		else q <= d;
	end
	
endmodule
