module bus_addr(s_address, s0_sel, s1_sel);	//address decode module
	input [15:0] s_address;			//input define
	output reg s0_sel, s1_sel;		//output define

	always @(s_address) begin		//when m_address value change
		if(16'h0000 <= s_address && s_address < 16'h0800) begin			//if s0
			s0_sel <= 1'b1;
			s1_sel <= 1'b0;
		end
		else if(16'h7000 <= s_address && s_address < 16'h7200) begin	//if s1
			s0_sel <= 1'b0;
			s1_sel <= 1'b1;
		end
		else begin						//if Invalid value
			s0_sel <= 1'b0;
			s1_sel <= 1'b0;
		end
	end
endmodule
