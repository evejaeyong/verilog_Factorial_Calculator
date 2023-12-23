`timescale 1ns/100ps
module tb_FactoControl;
	reg clk, reset_n, m_opdone;
	reg [63:0] opstart, opclear, operand;
	reg [127:0] result;				//input define
	
	wire [63:0] multiplier, multiplicand, next_opdone;
	wire m_opstart, m_opclear;		//output define
	
	FactoControl U0(clk, reset_n, m_opdone, opstart, opclear, operand, result,
							multiplier, multiplicand, m_opstart, m_opclear, next_opdone);	//module instance
	
	always begin						//clock setting
		clk = 1; #5; clk = 0; #5;
	end
	
	initial begin
		#0;	reset_n = 0; m_opdone = 1'b0; opstart = 64'b1; opclear = 64'b0; operand = 64'd5; result = 128'd10;
		#5;	reset_n = 1; m_opdone = 1'b1;
		#30;	operand = 64'd1;
		#300;	$stop;
	end
endmodule
