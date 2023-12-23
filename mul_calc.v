module mul_calc(state, multiplier, mul, multiplicand, count, result, op_done, next_count, next_multiplicand, next_result);
	input [1:0] state;
	input [63:0] multiplier, multiplicand , mul;
	input [127:0] result;
	input [6:0] count;					//input define
	
	output reg op_done;
	output reg [6:0] next_count;
	output reg [63:0] next_multiplicand;
	output reg [127:0] next_result;	//output define
	
	reg minus_1_bit;		//reg define

	wire [6:0] w_count;
	wire [63:0] plus, plus2;
	wire [63:0] minus, minus2;
	wire [127:0] res;						//wire define
	
	parameter INIT = 2'b00;
	parameter START = 2'b01;
	parameter END = 2'b11;				//parameter define
	
	cla8 U0(count, 7'b0, 1'b1, w_count);					//count + 1
	
	cla64 U1(result[127:64], multiplier, 0, plus);		//add
	cla64 U2(result[127:64], ~multiplier, 1, minus);	//sub
	cla64 U3(plus, multiplier, 0, plus2);					//add2
	cla64 U4(minus, ~multiplier, 1, minus2);				//sub2
	
	
	always @(state, multiplier, mul, multiplicand, count, result) begin
		case (state)
			INIT: begin											//INIT State
				op_done <= 1'b0;
				next_count <= 7'b0;
				next_multiplicand <= mul;
				next_result <= 128'b0;
			end
			
			START: begin										//START State
				if (count == 7'b010_0000) begin			//if count is 64
					op_done <= 1'b1;
					next_count <= count;
					next_multiplicand <= multiplicand;
					next_result <= result;
				end
				else begin
					op_done = 1'b0;
					next_count = w_count;
					next_multiplicand = {multiplicand[1], multiplicand[0], multiplicand[63:2]};	//circular shift

					if (count == 7'b0) minus_1_bit = 1'b0;
					else minus_1_bit = multiplicand[63];
					
					case ({multiplicand[1], multiplicand[0], minus_1_bit})		//radix-4
						3'b000 : begin
							next_result = {result[127], result[127], result[127:2]};				//2bit ASR
						end
					
						3'b001 : begin
							next_result = {plus, result[63:0]};
							next_result = {next_result[127], next_result[127], next_result[127:2]};	//2bit ASR
						end
					
						3'b010 : begin
							next_result = {plus, result[63:0]};
							next_result = {next_result[127], next_result[127], next_result[127:2]};	//2bit ASR
						end
					
						3'b011 : begin
							next_result = {plus2, result[63:0]};
							next_result = {next_result[127], next_result[127], next_result[127:2]};	//2bit ASR
						end
					
						3'b111 : begin
							next_result = {result[127], result[127], result[127:2]};				//2bit ASR
						end
					
						3'b110 : begin
							next_result = {minus, result[63:0]};
							next_result = {next_result[127], next_result[127], next_result[127:2]};	//2bit ASR
						end
						
						3'b101 : begin
							next_result = {minus, result[63:0]};
							next_result = {next_result[127], next_result[127], next_result[127:2]};	//2bit ASR
						end
						
						3'b100 : begin
							next_result = {minus2, result[63:0]};
							next_result = {next_result[127], next_result[127], next_result[127:2]};	//2bit ASR
						end
					endcase
				end
			end
			
			END: begin											//END State
				op_done <= 1'b1;
				next_count <= count;
				next_multiplicand <= multiplicand;
				next_result <= result;
			end
		endcase
	end
endmodule
