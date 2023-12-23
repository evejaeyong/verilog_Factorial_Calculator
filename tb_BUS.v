`timescale 1ns/100ps
module tb_BUS;
	reg clk, reset_n;
	reg m_req, m_wr;
	reg [15:0] m_addr;
	reg [63:0] m_dout, s0_dout, s1_dout;	//input define
	
	wire m_grant, s0_sel, s1_sel, s_wr;
	wire [15:0] s_addr;
	wire [63:0] m_din, s_din;				//output define
	
	BUS U0(clk, reset_n, m_req, m_wr, m_addr, m_dout, s0_dout, s1_dout,
				m_grant, m_din, s0_sel, s1_sel, s_addr, s_wr, s_din);	//module instance
				
	always begin								//clock setting
		clk = 1; #5; clk = 0; #5;
	end
	
	initial begin
		#0;	reset_n = 0; m_req = 0; m_wr = 0; m_addr = 16'h0010; m_dout = 10;
				s0_dout = 64'h0000_0000_1111_1111; s1_dout = 64'h0000_0000_2222_2222;
		#5;	reset_n = 1;
		#10;	m_req = 1; m_wr = 1;
		#10;	m_addr = 16'h7010;
		#10;	$stop;
	end
endmodule
