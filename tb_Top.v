`timescale 1ns/100ps
module tb_Top;
	reg clk, reset_n, m_req, m_wr;
	reg [15:0] m_addr;
	reg [63:0] m_dout;							//reg define
	
	wire m_grant, interrupt;
	wire [63:0] m_din;							//wire define
	
	Top U0(clk, reset_n, m_req, m_wr, m_addr, m_dout, m_grant, m_din, interrupt);	//module instance
	
	always begin			//clock setting
		clk = 1; #5; clk = 0; #5;
	end
	
	initial begin
		#0;	reset_n = 0; m_req = 1; m_wr = 1; m_addr = 16'h7018; m_dout = 64'b1;
		#5;	reset_n = 1;
		#20;	m_addr = 16'h7020;										//1!
		#10;	m_addr = 16'h7000;
		#10;	m_addr = 16'h7030; m_wr = 0;
		
		#50;	m_addr = 16'h7020; m_dout = 64'd10; m_wr = 1;	//10!
		#10;	m_addr = 16'h7008; m_dout = 64'b1;
		#10;	m_dout = 64'b0;
		#10;	m_addr = 16'h7000; m_dout = 64'b1;
		#20;	m_addr = 16'h7030; m_wr = 0;
		
		#1000;m_addr = 16'h7020; m_dout = 64'd72; m_wr = 1;	//72!
		#10;	m_addr = 16'h7008; m_dout = 64'b1;
		#10;	m_dout = 64'b0;
		#10;	m_addr = 16'h7000; m_dout = 64'b1;
		#20;	m_addr = 16'h7030;m_wr = 0;
		#50000; $stop;
	end
	
endmodule
