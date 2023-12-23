module register64_r_en(clk, reset_n, en, d, q); 	//64bits enable, Resettable Filp-Flop Module
	input clk, reset_n, en;
	input [63:0] d; 											//input define
	output reg [63:0] q; 									//output define
	
	always@(posedge clk or negedge reset_n) begin	//clock is rising edge and reset_n is falling edge
		if(reset_n == 0) q <= 64'b0;
		else if(en) q <= d;
		else q <= q;
	end
	
endmodule
