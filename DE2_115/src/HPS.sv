module HPS (
	input i_clk,
	input i_rst_n,
	input [9:0] i_cnt,
	input [31:0] i_square_add,
	output [24:0] o_note,
	output [31:0] o_power
);

logic [63:0][31:0] f_domain_r, f_domain_w;
logic [24:0][31:0] pre_low_r , pre_low_w;
logic [24:0][31:0] pre_band_r,pre_band_w;
logic [24:0][31:0] pre_high_r,pr_high_w;
logic [31:0] power_low_r, power_low_w;
logic [31:0] power_band_r, power_band_w;
logic [31:0] power_high_r, power_high_w;
logic [31:0] max_r, max_w, now_power_r, now_power_w, pre_power_r, pre_power_w;
logic [9:0] max_index_r, max_index_w;
logic [24:0] note_r, note_w;

assign o_note = note_r;
assign o_power = now_power_r;

always_comb begin
	f_domain_w = f_domain_r;
	max_w = max_r;
	max_index_w = max_index_r;
	note_w = note_r;
	power_low_w = power_low_r;
	power_band_w = power_band_r;
	power_high_w = power_high_r;
	now_power_w = now_power_r;
	pre_power_w = pre_power_r;
	if (i_cnt >= 0 && i_cnt < 28) begin
		power_low_w = power_low_r + i_square_add;
	end
	if (i_cnt >= 28 && i_cnt < 56) begin
		power_band_w = power_band_r + i_square_add;
	end
	if (i_cnt >= 56 && i_cnt < 512) begin
		power_high_w = power_high_r + i_square_add;
	end
	if (i_cnt < 64) begin
		f_domain_w[i_cnt] = f_domain_r[i_cnt] + i_square_add;
	end
	if (i_cnt < 128) begin
		if (i_cnt % 2 == 0) begin
			f_domain_w[i_cnt/2] = f_domain_r[i_cnt/2] + i_square_add;
		end
	end
	if (i_cnt < 192) begin
		if (i_cnt % 3 == 0) begin
			f_domain_w[i_cnt/3] = f_domain_r[i_cnt/3] + i_square_add;
		end
	end
	if (i_cnt < 256) begin
		if (i_cnt % 4 == 0) begin
			f_domain_w[i_cnt/4] = f_domain_r[i_cnt/4] + i_square_add;
		end
	end
	if (i_cnt < 320) begin
		if (i_cnt % 5 == 0) begin
			f_domain_w[i_cnt/5] = f_domain_r[i_cnt/5] + i_square_add;
		end
	end
	if (i_cnt < 384) begin
		if (i_cnt % 6 == 0) begin
			f_domain_w[i_cnt/6] = f_domain_r[i_cnt/6] + i_square_add;
		end
	end
	if (i_cnt < 448) begin
		if (i_cnt % 7 == 0) begin
			f_domain_w[i_cnt/7] = f_domain_r[i_cnt/7] + i_square_add;
		end
	end
	if (i_cnt < 512) begin
		if (i_cnt % 8 == 0) begin
			f_domain_w[i_cnt/8] = f_domain_r[i_cnt/8] + i_square_add;
		end
	end
	else begin
		if (i_cnt >= 512 && i_cnt < 512+28) begin
			if (f_domain_r[i_cnt - 512 + 28] > max_r) begin
				max_w = f_domain_r[i_cnt - 512 + 28];
				max_index_w = i_cnt - 512 + 28;
			end
		end
		else if (i_cnt == 540) begin
			if ((power_band_r + power_high_r * 2) < (power_low_r)) note_w = 0;
			else if (pre_power_r * 2 < now_power_r) begin
				case (max_index_r)
					27	: note_w = (1<<11);
					28	: note_w = (1<<12);
					29	: note_w = (1<<12);
					30	: note_w = (1<<13);
					31	: note_w = (1<<13);
					32	: note_w = (1<<14);
					33	: note_w = (1<<15);
					34	: note_w = (1<<15);
					35	: note_w = (1<<16);
					36	: note_w = (1<<16);
					37	: note_w = (1<<17);
					38	: note_w = (1<<17);
					39	: note_w = (1<<18);
					40	: note_w = (1<<18);
					41	: note_w = (1<<19);
					42	: note_w = (1<<19);
					43	: note_w = (1<<19);
					44	: note_w = (1<<20);
					45	: note_w = (1<<20);
					46	: note_w = (1<<21);
					47	: note_w = (1<<21);
					48	: note_w = (1<<21);
					49	: note_w = (1<<22);
					50	: note_w = (1<<22);
					51	: note_w = (1<<22);
					52	: note_w = (1<<23);
					53	: note_w = (1<<23);
					54	: note_w = (1<<23);
					55	: note_w = (1<<24);
					56	: note_w = (1<<24);
				endcase
			end
		end
	end
	if (i_cnt == 1023) begin
		f_domain_w = 0;
		max_w = 0;
		max_index_w = 0;
		power_high_w = 0;
		power_band_w = 0;
		power_low_w = 0;
		now_power_w = power_high_r;
		pre_power_w = now_power_r;
	end
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		f_domain_r <= 0;
		max_r <= 0;
		max_index_r <= 0;
		note_r <= 0;
		power_low_r <= 0;
		power_band_r <= 0;
		power_high_r <= 0;
		now_power_r <= 0;
		pre_power_r <= 0;
	end
	else begin
		f_domain_r <= f_domain_w;
		max_r <= max_w;
		max_index_r <= max_index_w;
		note_r <= note_w;
		power_low_r <= power_low_w;
		power_band_r <= power_band_w;
		power_high_r <= power_high_w;
		now_power_r <= now_power_w;
		pre_power_r <= pre_power_w;
	end
end
endmodule
