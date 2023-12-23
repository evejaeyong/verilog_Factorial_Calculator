module ram(clk, cen, wen, s_addr, s_din, s_dout);	//ram module
	input clk;
	input cen, wen;
	input [7:0] s_addr;
	input [63:0] s_din;			//input define
	
	output reg [63:0] s_dout;	//output define
	
	reg [63:0] mem [0:255];		//memory define

	integer i;					//iterator

	initial begin
		for (i = 0; i < 256; i = i + 1) mem[i] = 64'b0;	//initialize memory
	end
	
	always @(posedge clk) begin
		case ({cen, wen})							//cen, wen
			2'b00:	s_dout <= 64'b0;			//00
			2'b01:	s_dout <= 64'b0;			//01
			2'b10:	s_dout <= mem[s_addr];	//10
			2'b11:	begin							//11
				s_dout <= 64'b0;
				mem[s_addr] <= s_din;
			end
		endcase
	end
	
endmodule
