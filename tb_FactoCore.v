`timescale 1ns/100ps
module tb_FactoCore;
	reg clk, reset_n, s_sel, s_wr;
	reg [15:0] s_addr;
	reg [63:0] s_din;					//reg define
	
	wire [63:0] s_dout;
	wire interrupt;					//wire define
	
	FactoCore U0(clk, reset_n, s_sel, s_wr, s_addr, s_din, s_dout, interrupt);	//module instance
	
	always begin						//clock setting
		clk = 1; #5; clk = 0; #5;
	end
	
	initial begin
		#0;	reset_n = 0; s_sel = 1; s_wr = 1; s_addr = 16'h7020; s_din = 64'd20;
		#5;	reset_n = 1;
		#10;	s_addr = 16'h7000; s_din = 1;
		#10;	s_addr = 16'h7018;
		#10;	s_wr = 0; s_addr = 16'h7030;
		#10000;$finish;
	end
endmodule
