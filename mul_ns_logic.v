module mul_ns_logic(op_start, op_clear, op_done, state, next_state);	//multiplier next state logic module
	input op_start, op_clear, op_done;
	input [1:0] state;				//input define
	output reg [1:0] next_state;	//output define
	
	parameter INIT = 2'b00;
	parameter START = 2'b01;
	parameter END = 2'b11;			//parameter define
	
	always @(state, op_start, op_clear, op_done) begin
		case(state)
			INIT: begin					//State INIT
				if (op_clear == 1'b1) next_state <= INIT;			//if op_clear is 1
				else if (op_start == 1'b1) next_state <= START;
				else next_state <= INIT;
			end
			
			START: begin				//State START
				if (op_clear == 1'b1) next_state <= INIT;			//if op_clear is 1
				else if (op_done == 1'b1) next_state <= END;
				else next_state <= START;
			end
			
			END: begin					//State END
				if (op_clear == 1'b1) next_state <= INIT;			//if op_clear is 1
				else next_state <= END;
			end
			
			default: next_state <= 2'bxx;	//Default
		endcase
	end
	
endmodule
