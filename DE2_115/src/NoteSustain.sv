module NoteSustain (
	input i_clk,
	input i_rst_n,
	input [24:0] i_note_trigger,
	output [24:0] o_note
);

logic [24:0] note_r, note_w;
logic [24:0][15:0] cnt_r, cnt_w;
assign o_note = note_r;


always_comb begin
	note_w = note_r;
	cnt_w = cnt_r;
	for (int i=0; i<25; i++) begin
		if (i_note_trigger[i] == 1) begin
			note_w[i] = 1;
			cnt_w[i] = 15000;
		end
		else begin
			if (cnt_r[i] == 1) begin
				note_w[i] = 0;
				//if (i_note_trigger[i] == 2) note_w[i] = 0;
			end
			else if (cnt_r[i] > 0) begin
				cnt_w[i] = cnt_r[i] - 1;
			end
		end
	end
end


always_ff @(posedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		note_r <= 0;
		cnt_r <= 0;
	end
	else begin
		note_r <= note_w;
		cnt_r <= cnt_w;
	end
end
endmodule
