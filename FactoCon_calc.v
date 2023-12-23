module FactoCon_calc(state, operand, multiplier, multiplicand, result, next_opstart, next_opclear, opdone, next_multiplier, next_multiplicand, next_result, res_s);
	input [2:0] state;
	input [63:0] operand, multiplier, multiplicand;
	input [127:0] result;				//input define
	
	output reg next_opstart, next_opclear, res_s;
	output reg [63:0] opdone, next_multiplier, next_multiplicand;
	output reg [127:0] next_result;	//output define
	
	parameter INIT = 3'b000;
	parameter START = 3'b001;
	parameter CALC = 3'b010;
	parameter MUL_CLEAR = 3'b011;
	parameter OPER_MINUS = 3'b100;
	parameter END = 3'b111;				//state encoding
	
	always @(state, operand, multiplier, multiplicand, result) begin
		case (state)
			INIT: begin
				next_opstart = 1'b0;
				next_opclear = 1'b1;
				opdone = 64'b00;
				next_multiplier = 0;
				next_multiplicand = 0;
				next_result = 128'b1;
				res_s = 1;
			end
			
			START: begin
				next_opstart = 1'b1;
				next_opclear = 1'b0;
				opdone = 64'b10;
				next_multiplier = operand;
				next_multiplicand = operand - 1;
				next_result = result;
				res_s = 0;
			end
			
			CALC: begin
				next_opstart = 1'b1;
				next_opclear = 1'b0;
				opdone = 64'b10;
				next_multiplier = multiplier;
				next_multiplicand = multiplicand;
				next_result = result;
				res_s = 1;
			end
			
			MUL_CLEAR: begin
				next_opstart = 1'b0;
				next_opclear = 1'b1;
				opdone = 64'b10;
				next_multiplier = multiplier;
				next_multiplicand = multiplicand;
				next_result = result;
				res_s = 0;
			end
			
			OPER_MINUS: begin
				next_opstart = 1'b1;
				next_opclear = 1'b0;
				opdone = 64'b10;
				if (result[63:0] == 64'b0) next_multiplier = result[127:64];
				else next_multiplier = result[63:0];
				next_multiplicand = multiplicand - 1;
				next_result = result;
				res_s = 1;
			end
			
			END: begin
				next_opstart = 1'b0;
				next_opclear = 1'b0;
				opdone = 64'b11;
				next_multiplier = multiplier;
				next_multiplicand = multiplicand;
				next_result = result;
				res_s = 1;
			end
			default: begin
				next_opstart = 1'bx;
				next_opclear = 1'bx;
				opdone = 64'bx;
				next_multiplier = 64'bx;
				next_multiplicand = 64'bx;
				next_result = 128'bx;
				res_s = 1;
			end
		endcase
	end
endmodule
