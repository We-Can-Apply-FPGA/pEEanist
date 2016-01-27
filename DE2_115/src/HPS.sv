module HPS (
	input i_clk,
	input i_rst_n,
	
	input [10:0] i_cnt,
	
	input [31:0] i_square_add,
	input [14:0] i_multi,
	output [24:0] o_note,
	output signed [31:0] o_debug,
	output [31:0] o_debug_max
);

logic [63:0][31:0] f_domain_r, f_domain_w;
logic [4:0] max_idx_r, max_idx_w;
logic signed [31:0] max_r, max_w;
logic [24:0] note_r, note_w;
logic [26:0][31:0] pre_mag_r, now_mag_r, pre_mag_w, now_mag_w;
logic signed [31:0] cost_r[24:0], cost_w[24:0];
logic signed [31:0] debug_r, debug_w, debug_max_r, debug_max_w;

//assign o_note = note_r;
assign o_debug = debug_r;
assign o_debug_max = debug_max_r;

logic [4:0] note_index;
logic [1:0] note_avg;

TurnNote tn0(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_f_idx(i_cnt - 1024),
	.o_note_idx(note_index),
	.o_note_avg(note_avg)
);

NoteSustain ns(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_note_trigger(note_r),
	.o_note(o_note)
);

always_comb begin
	f_domain_w = f_domain_r;
	
	now_mag_w = now_mag_r;
	pre_mag_w = pre_mag_r;
	cost_w = cost_r;
	max_w = max_r;
	max_idx_w = max_idx_r;
	note_w = note_r;
	
	debug_w = debug_r;
	debug_max_w = debug_max_r;
	
	if (i_cnt < 64) begin
		f_domain_w[i_cnt] = f_domain_r[i_cnt] + i_square_add;
	end
	if (i_cnt < 128) begin
		if (i_cnt % 2 == 0) f_domain_w[i_cnt/2] = f_domain_r[i_cnt/2] + i_square_add;
	end
	if (i_cnt < 192) begin
		if (i_cnt % 3 == 0) f_domain_w[i_cnt/3] = f_domain_r[i_cnt/3] + i_square_add;
	end
	if (i_cnt < 256) begin
		if (i_cnt % 4 == 0) f_domain_w[i_cnt/4] = f_domain_r[i_cnt/4] + i_square_add;
	end
	if (i_cnt < 320) begin
		if (i_cnt % 5 == 0) f_domain_w[i_cnt/5] = f_domain_r[i_cnt/5] + i_square_add;
	end
	if (i_cnt < 384) begin
		if (i_cnt % 6 == 0) f_domain_w[i_cnt/6] = f_domain_r[i_cnt/6] + i_square_add;
	end
	if (i_cnt < 448) begin
		if (i_cnt % 7 == 0) f_domain_w[i_cnt/7] = f_domain_r[i_cnt/7] + i_square_add;
	end
	if (i_cnt < 512) begin
		if (i_cnt % 8 == 0) f_domain_w[i_cnt/8] = f_domain_r[i_cnt/8] + i_square_add;
	end
	if (i_cnt < 576) begin
		if (i_cnt % 9 == 0) f_domain_w[i_cnt / 9] = f_domain_r[i_cnt / 9] + i_square_add;
	end
	if (i_cnt < 640) begin
		if (i_cnt % 10 == 0) f_domain_w[i_cnt / 10] = f_domain_r[i_cnt / 10] + i_square_add;
	end
	if (i_cnt < 704) begin
		if (i_cnt % 11 == 0) f_domain_w[i_cnt / 11] = f_domain_r[i_cnt / 11] + i_square_add;
	end
	if (i_cnt < 768) begin
		if (i_cnt % 12 == 0) f_domain_w[i_cnt / 12] = f_domain_r[i_cnt / 12] + i_square_add;
	end
	if (i_cnt < 832) begin
		if (i_cnt % 13 == 0) f_domain_w[i_cnt / 13] = f_domain_r[i_cnt / 13] + i_square_add;
	end
	if (i_cnt < 896) begin
		if (i_cnt % 14 == 0) f_domain_w[i_cnt / 14] = f_domain_r[i_cnt / 14] + i_square_add;
	end
	if (i_cnt < 960) begin
		if (i_cnt % 15 == 0) f_domain_w[i_cnt / 15] = f_domain_r[i_cnt / 15] + i_square_add;
	end
	if (i_cnt < 1024) begin
		if (i_cnt % 16 == 0) f_domain_w[i_cnt / 16] = f_domain_r[i_cnt / 16] + i_square_add;
	end

	//Begin to calculate each freq's magnitude
	else begin
		if (i_cnt < 1024+64) begin
			now_mag_w[note_index] = now_mag_r[note_index] + f_domain_r[i_cnt-1024] / note_avg;
		end
		else if(i_cnt < 1024+64+25) begin
			if (i_cnt-1088 == i_multi) debug_w = now_mag_r[i_cnt-1088];
			cost_w[i_cnt-1088] = now_mag_r[i_cnt-1088] - pre_mag_r[i_cnt-1088];
			pre_mag_w[i_cnt-1088] = now_mag_r[i_cnt-1088];
			now_mag_w[i_cnt-1088] = pre_mag_r[i_cnt-1088]/16;
		end
		else if(i_cnt < 1024+64+25+25) begin
			if(cost_r[i_cnt-1113] > max_r) begin
				max_w = cost_r[i_cnt-1113];
				max_idx_w = i_cnt-1113;
			end
		end
		else if (i_cnt == 1024+64+25+25) begin
			debug_max_w = max_r;
			if (max_r > (i_multi << 5)) note_w = (1 << max_idx_r);
			else note_w = 0;
		end
	end
	if (i_cnt == 2047) begin
		f_domain_w = '0;
		note_w = 0;
		pre_mag_w = now_mag_r;
		now_mag_w = 0;
	end
end

always_ff @(posedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		f_domain_r <= 0;
		now_mag_r <= 0;
		pre_mag_r <= 0;
		for (int i=0; i<25; i++) begin
			cost_r[i] <= 0;
		end
		max_r <= 0;
		max_idx_r <= 0;
		note_r <= 0;
		debug_r <= 0 ;
		debug_max_r <= 0;
	end
	else begin
		f_domain_r <= f_domain_w;
		now_mag_r <= now_mag_w;
		pre_mag_r <= pre_mag_w;
		cost_r <= cost_w;
		max_r <= max_w;
		max_idx_r <= max_idx_w;
		note_r <= note_w;
		debug_r <= debug_w;
		debug_max_r <= debug_max_w;
	end
end
endmodule
