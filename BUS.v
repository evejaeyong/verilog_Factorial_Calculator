module BUS(clk, reset_n, m_req, m_wr, m_addr, m_dout, s0_dout, s1_dout,
				m_grant, m_din, s0_sel, s1_sel, s_addr, s_wr, s_din);		//bus module
	input clk, reset_n;
	input m_req, m_wr;
	input [15:0] m_addr;
	input [63:0] m_dout, s0_dout, s1_dout;	//input define
	
	output m_grant, s0_sel, s1_sel, s_wr;
	output [15:0] s_addr;
	output [63:0] m_din, s_din;				//output define
	
	wire [1:0] s_sel;								//wire define
	
	dff_r U0(clk, reset_n, m_req, m_grant);
	
	mx2 U1(1'b0, m_wr, m_grant, s_wr);
	mx2_16bit U2(16'b0, m_addr, m_grant, s_addr);
	mx2_64bit U3(64'b0, m_dout, m_grant, s_din);
	
	bus_addr U4(s_addr, s0_sel, s1_sel);
	
	register2_r U5(clk, reset_n, {s0_sel, s1_sel}, s_sel);
	mx3_64bit U6(64'b0, s0_dout, s1_dout, s_sel, m_din);	//module instance
	
endmodule
