module HPS (
	input i_clk,
	input i_rst_n,
	input [9:0] i_cnt,
	input [31:0] i_square_add,
	output [24:0] o_note,
	output[31:0] o_debug
);

logic [63:0][31:0] f_domain_r , f_domain_w;
logic [24:0][31:0] pre_mag_r,now_mag_r,pre_mag_w,now_mag_w;
logic [4:0] note;
logic [31:0] debug_r,debug_w;
logic [24:0] note_r, note_w;
logic [31:0] note_mag;
assign o_note = note_r;
assign o_debug = debug_r;
TurnNote tn(
	.i_clk(i_clk),
	.i_rst_n(i_rst_n),
	.i_f_domain_idx(i_cnt-512),
	.o_note(note)

);
always_comb begin
	f_domain_w = f_domain_r;
	debug_w = debug_r;
	note_w = note_r;
	
	//Multiplaction step turn to addition from downsampling spectrum
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

	//Begin to calculate each freq's magnitude
	else begin
		if (i_cnt >= 512 && i_cnt < 512+64) begin
			now_mag_w[note] = now_mag_r[note] + f_domain_r[i_cnt-512];
		end
		if(i_cnt >= 576 && i_cnt < 576+25)begin
			if(now_mag_r[i_cnt - 576] > pre_mag_r[i_cnt - 576]*50 )begin
				note_w = note_r + (1 << (i_cnt -576));
			end
		end
	end
	if (i_cnt == 1023) begin
		f_domain_w = '0;
		note_w = 0;
		pre_mag_w = now_mag_r;
		debug_w = now_mag_r[20];
		now_mag_w = 0;
	end
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		f_domain_r <= 0;
		note_r <= 0;
		pre_mag_r <=0;
		now_mag_r <=0;
		debug_r <= 0 ;
	end
	else begin
		f_domain_r <= f_domain_w;
		note_r <= note_w;
		pre_mag_r <= pre_mag_w;
		now_mag_r <= now_mag_w;
		debug_r <= debug_w;
	end
end
endmodule
