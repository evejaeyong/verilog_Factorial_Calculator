module FactoCore(clk, reset_n, s_sel, s_wr, s_addr, s_din, s_dout, interrupt);	//Factorial Core Module
	input clk, reset_n, s_sel, s_wr;
	input [15:0] s_addr;
	input [63:0] s_din;					//input define
	
	output [63:0] s_dout;
	output interrupt;						//output define
	
	wire m_opstart, m_opclear, m_opdone, wEn1;
	wire [63:0] mem [6:0];				//memory define
	wire [63:0] next_opdone, multiplier, multiplicand, op_start, next_result_h, next_result_l;
	wire [2:0] addr;
	wire [6:0] wEn;
	wire [127:0] m_result, f_result;	//wire define
	
	parameter opstart = 3'b000;
	parameter opclear = 3'b001;
	parameter opdone = 3'b010;
	parameter intrEn = 3'b011;
	parameter operand = 3'b100;
	parameter result_h = 3'b101;
	parameter result_l = 3'b110;		//memory address
	
	register64_r_en	U0(clk, reset_n, wEn1, op_start, mem[opstart]);
	register64_r_en	U1(clk, reset_n, wEn[1], s_din, mem[opclear]);
	register64_r		U2(clk, reset_n, next_opdone, mem[opdone]);
	register64_r_en	U3(clk, reset_n, wEn[3], s_din, mem[intrEn]);
	register64_r_en	U4(clk, reset_n, wEn[4], s_din, mem[operand]);
	register64_r		U5(clk, reset_n, next_result_h, mem[result_h]);
	register64_r_1		U6(clk, reset_n, next_result_l, mem[result_l]);	//register
	
	FactoDecode			U7(s_sel, s_addr, addr);
	Facto_read 			U8(addr, s_dout, mem[0], mem[1], mem[2], mem[3], mem[4], mem[5], mem[6]);
	Facto_write			U9(addr, s_wr, wEn);										//read & write logic
	
	_and2					U10(mem[opdone][0], mem[intrEn][0], interrupt);	//interrupt
	
	FactoControl		U11(clk, reset_n, m_opdone, mem[0], mem[1], mem[4], {mem[5], mem[6]},
								multiplier, multiplicand, m_opstart, m_opclear, next_opdone, f_result, res_s);
	multiplier			U12(clk, reset_n, multiplicand, multiplier, m_opstart, m_opclear, m_opdone, m_result);
	
	mx2_64bit			U13(m_result[127:64], f_result[127:64], res_s, next_result_h);
	mx2_64bit			U14(m_result[63:0], f_result[63:0], res_s, next_result_l);		//result
	
	mx2					U15(wEn[0], 1'b1, mem[opclear][0], wEn1);
	mx2_64bit			U16(s_din, 64'b0, mem[opclear][0], op_start);						//clear
		
endmodule
