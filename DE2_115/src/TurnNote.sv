module TurnNote(
	input i_clk,
	input i_rst_n,
	input[31:0] i_f_domain_idx,
	output[4:0] o_note
);
always_comb begin
	case(i_f_domain_idx)
		13: o_note = 0;
		14: o_note = 0;
		15: o_note = 1;
		16: o_note = 2;
		17: o_note = 3;
		18: o_note = 4;
		19: o_note = 5;
		20: o_note = 6;
		21: o_note = 7;
		22: o_note = 8;
		23: o_note = 9;
		24: o_note = 9;
		25: o_note = 10;
		26: o_note = 10;
		27: o_note = 11;
		28: o_note = 12;
		29: o_note = 12;
		30: o_note = 13;
		31: o_note = 13;
		32: o_note = 14;
		33: o_note = 15;
		34: o_note = 15;
		35: o_note = 16;
		36: o_note = 16;
		37: o_note = 17;
		38: o_note = 17;
		39: o_note = 18;
		40: o_note = 18;
		41: o_note = 19;
		42: o_note = 19;
		43: o_note = 19;
		44: o_note = 20;
		45: o_note = 20;
		46: o_note = 21;
		47: o_note = 21;
		48: o_note = 21;
		49: o_note = 22;
		50: o_note = 22;
		51: o_note = 22;
		52: o_note = 23;
		53: o_note = 23;
		54: o_note = 23;
		55: o_note = 24;
		56: o_note = 24;
		57: o_note = 24;
		default:o_note=0;
	endcase
end
endmodule
