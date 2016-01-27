module TurnNote(
	input i_clk,
	input i_rst_n,
	input[5:0] i_f_idx,
	output[4:0] o_note_idx,
	output[1:0] o_note_avg
);
always_comb begin
	if (i_f_idx < 13) begin
		o_note_idx = 25;
		o_note_avg = 1;
	end
	else if (i_f_idx < 14) begin
		o_note_idx = 0;
		o_note_avg = 1;
	end
	else if (i_f_idx < 15) begin
		o_note_idx = 1;
		o_note_avg = 1;
	end
	else if (i_f_idx < 16) begin
		o_note_idx = 2;
		o_note_avg = 1;
	end
	else if (i_f_idx < 17) begin
		o_note_idx = 3;
		o_note_avg = 1;
	end
	else if (i_f_idx < 18) begin
		o_note_idx = 4;
		o_note_avg = 1;
	end
	else if (i_f_idx < 19) begin
		o_note_idx = 5;
		o_note_avg = 1;
	end
	else if (i_f_idx < 21) begin
		o_note_idx = 6;
		o_note_avg = 2;
	end
	else if (i_f_idx < 22) begin
		o_note_idx = 7;
		o_note_avg = 1;
	end
	else if (i_f_idx < 23) begin
		o_note_idx = 8;
		o_note_avg = 1;
	end
	else if (i_f_idx < 24) begin
		o_note_idx = 9;
		o_note_avg = 1;
	end
	else if (i_f_idx < 26) begin
		o_note_idx = 10;
		o_note_avg = 2;
	end
	else if (i_f_idx < 27) begin
		o_note_idx = 11;
		o_note_avg = 1;
	end
	else if (i_f_idx < 29) begin
		o_note_idx = 12;
		o_note_avg = 2;
	end
	else if (i_f_idx < 31) begin
		o_note_idx = 13;
		o_note_avg = 2;
	end
	else if (i_f_idx < 33) begin
		o_note_idx = 14;
		o_note_avg = 2;
	end
	else if (i_f_idx < 34) begin
		o_note_idx = 15;
		o_note_avg = 1;
	end
	else if (i_f_idx < 37) begin
		o_note_idx = 16;
		o_note_avg = 3;
	end
	else if (i_f_idx < 39) begin
		o_note_idx = 17;
		o_note_avg = 2;
	end
	else if (i_f_idx < 41) begin
		o_note_idx = 18;
		o_note_avg = 2;
	end
	else if (i_f_idx < 43) begin
		o_note_idx = 19;
		o_note_avg = 2;
	end
	else if (i_f_idx < 46) begin
		o_note_idx = 20;
		o_note_avg = 3;
	end
	else if (i_f_idx < 49) begin
		o_note_idx = 21;
		o_note_avg = 3;
	end
	else if (i_f_idx < 52) begin
		o_note_idx = 22;
		o_note_avg = 3;
	end
	else if (i_f_idx < 55) begin
		o_note_idx = 23;
		o_note_avg = 3;
	end
	else if (i_f_idx < 58) begin
		o_note_idx = 24;
		o_note_avg = 3;
	end
	else begin
		o_note_idx = 26;
		o_note_avg = 1;
	end
end
endmodule
