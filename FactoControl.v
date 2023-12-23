module FactoControl(clk, reset_n, m_opdone, opstart, opclear, operand, result,
							multiplier, multiplicand, m_opstart, m_opclear, next_opdone, next_result, res_s);
	input clk, reset_n, m_opdone;
	input [63:0] opstart, opclear, operand;
	input [127:0] result;									//input define
	
	output [63:0] multiplier, multiplicand, next_opdone;
	output m_opstart, m_opclear, res_s;
	output [127:0] next_result;							//output define
	
	wire next_opstart, next_opclear;
	wire [2:0] state, next_state;
	wire [63:0] next_multiplier, next_multiplicand;	//wire define
	
	register64_r	U0(clk, reset_n, next_multiplier, multiplier);
	register64_r	U1(clk, reset_n, next_multiplicand, multiplicand);
	register3_r		U2(clk, reset_n, next_state, state);
	dff_r				U3(clk, reset_n, next_opstart, m_opstart);
	dff_r				U4(clk, reset_n, next_opclear, m_opclear);		//register
	
	FactoCon_ns_logic	U5(m_opdone, opstart, opclear, operand, next_multiplicand, state, next_state);	//next state
	FactoCon_calc		U6(next_state, operand, multiplier, multiplicand, result, next_opstart, next_opclear, 
								next_opdone, next_multiplier, next_multiplicand, next_result, res_s);			//calculate
endmodule
