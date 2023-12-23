module multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result); //64bits multipier module 
	input clk, reset_n, op_start, op_clear;
	input [63:0] multiplier, multiplicand;	//input define
	output op_done;
	output [127:0] result;						//output define
	
	wire done, next_opdone;
	wire [1:0] state, next_state;
	wire [6:0] count, next_count;
	wire [63:0] temp_multiplicand, next_multiplicand;
	wire [127:0] next_result;					//wire define
	
	//dff_r			U0(clk, reset_n, next_opdone, op_done);
	register2_r U1(clk, reset_n, next_state, state);
	register7_r U2(clk, reset_n, next_count, count);
	register64_r U3(clk, reset_n, next_multiplicand, temp_multiplicand);
	register128_r U4(clk, reset_n, next_result, result);					//register instance
	
	mul_ns_logic U5(op_start, op_clear, op_done, state, next_state);
	mul_calc U6(state, multiplier, multiplicand, temp_multiplicand, count, result, op_done, next_count, next_multiplicand, next_result);
																							//module instance
endmodule
