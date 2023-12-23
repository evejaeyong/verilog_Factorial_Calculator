module FactoCon_ns_logic(m_opdone, opstart, opclear, operand, next_multiplicand, state, next_state);
	input m_opdone;
	input [63:0] opstart, opclear, operand, next_multiplicand;
	input [2:0] state;				//input define
	
	output reg [2:0] next_state;	//output define
	
	parameter INIT = 3'b000;
	parameter START = 3'b001;
	parameter CALC = 3'b010;
	parameter MUL_CLEAR = 3'b011;
	parameter OPER_MINUS = 3'b100;
	parameter END = 3'b111;			//state encoding
	
	always @(m_opdone, opstart, opclear, operand, state) begin
		case (state)
			INIT: begin
				if (opclear[0] == 1'b1) next_state = INIT;
				else if (opstart[0] == 1'b1 && operand <= 64'b1) next_state = END;
				else if (opstart[0] == 1'b1) next_state = START;
				else next_state = INIT;
			end
			
			START: begin
				if (opclear[0] == 1'b1) next_state = INIT;
				else next_state = CALC;
			end
			
			CALC: begin
				if (opclear[0] == 1'b1) next_state = INIT;
				else if (m_opdone == 1'b1 && next_multiplicand <= 64'b1) next_state = END;
				else if (m_opdone == 1'b1) next_state = MUL_CLEAR;
				else next_state = CALC;
			end
			
			MUL_CLEAR: begin
				if (opclear[0] == 1'b1) next_state = INIT;
				else next_state = OPER_MINUS;
			end
			OPER_MINUS: begin
				if (opclear[0] == 1'b1) next_state = INIT;
				else next_state = CALC;
			end
			
			END: begin
				if (opclear[0] == 1'b1) next_state = INIT;
				else next_state = END;
			end
			default: next_state = 3'bxxx;
		endcase
	end
endmodule
