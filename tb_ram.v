`timescale 1ns/100ps
module tb_ram;
	reg clk;
	reg cen, wen;
	reg [7:0] s_addr;
	reg [63:0] s_din;			//reg define
	
	wire [63:0] s_dout;		//wire define
	
	ram U0(clk, cen, wen, s_addr, s_din, s_dout); //module instance
	
	always begin								//clock setting
		clk = 1; #5; clk = 0; #5;
	end
	
	initial begin
		#0;	cen = 0; wen = 0; s_addr = 8'h00; s_din = 1;
		#10;	cen = 1; wen = 1;
		#10;	s_addr = 8'h01; s_din = 2;
		#10;	s_addr = 8'h02; s_din = 3;
		#10;	s_addr = 8'h03; s_din = 4;
		#10;	s_addr = 8'h04; s_din = 5;
		#10;	s_addr = 8'h10; s_din = 10;
		#10;	s_addr = 8'h20; s_din = 11;
		#10;	s_addr = 8'h30; s_din = 12;
		#10;	wen = 0; s_addr = 8'h00;
		#10;	s_addr = 8'h01;
		#10;	s_addr = 8'h02;
		#10;	s_addr = 8'h03;
		#10;	s_addr = 8'h04;
		#10;	s_addr = 8'h10;
		#10;	s_addr = 8'h20;
		#10;	s_addr = 8'h30;
		#10;	$stop;
	end
endmodule
