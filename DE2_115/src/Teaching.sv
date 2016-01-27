module Teaching(
	input i_clk,
	input i_rst_n,
	input [24:0] GPI,
	output [24:0] o_note,
	output [5:0] o_cnt,
	output o_ok
);

logic [24:0] notes[18:0];
logic [5:0] cnt_r, cnt_w;
logic ok_r, ok_w;

assign notes[0] = 1<<19;
assign notes[1] = 1<<18;
assign notes[2] = 1<<19;
assign notes[3] = 1<<18;
assign notes[4] = 1<<19;
assign notes[5] = 1<<14;
assign notes[6] = 1<<17;
assign notes[7] = 1<<15;
assign notes[8] = (1<<12)+(1<<0);
assign notes[9] = 1<<7;
assign notes[10] = 1<<12;
assign notes[11] = 1<<3;
assign notes[12] = 1<<7;
assign notes[13] = 1<<12;
assign notes[14] = 1<<14;
assign notes[15] = 1<<7;
assign notes[16] = 1<<11;
assign notes[17] = 1<<14;
assign notes[18] = 1<<15;

assign o_note = notes[cnt_r];
assign o_ok = ok_r;
assign o_cnt = cnt_r;

always_comb begin
	cnt_w = cnt_r;
	ok_w = ok_r;
	if (!ok_r && GPI == notes[cnt_r]) begin
		ok_w = 1;
	end
	else if (ok_r && GPI != notes[cnt_r]) begin
		ok_w = 0;
		if (cnt_r == 18) cnt_w = 0;
		else cnt_w = cnt_r + 1;
	end
end



always_ff @(posedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		cnt_r <= 0;
		ok_r <= 0;
	end
	else begin
		cnt_r <= cnt_w;
		ok_r <= ok_w;
	end
end

endmodule



