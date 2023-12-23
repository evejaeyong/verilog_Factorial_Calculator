module Top(clk, reset_n, m_req, m_wr, m_addr, m_dout, m_grant, m_din, interrupt);	//Top Module
	input clk, reset_n, m_req, m_wr;
	input [15:0] m_addr;
	input [63:0] m_dout;							//input define
	
	output m_grant, interrupt;
	output [63:0] m_din;							//output define
	
	wire s0_sel, s1_sel, s_wr;
	wire [15:0] s_addr;
	wire [63:0] s0_dout, s1_dout, s_din;	//wire define
	
	ram U0(clk, s0_sel, s_wr, s_addr[10:3], s_din, s0_dout);
	
	FactoCore U1(clk, reset_n, s1_sel, s_wr, s_addr, s_din, s1_dout, interrupt);
	
	BUS U2(clk, reset_n, m_req, m_wr, m_addr, m_dout, s0_dout, s1_dout, 
			m_grant, m_din, s0_sel, s1_sel, s_addr, s_wr, s_din);				//module instance
endmodule
