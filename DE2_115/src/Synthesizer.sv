module Synthesizer(
	input i_clk,
	input i_synth_mode,
	input i_rst_n,
	input [24:0] i_note,
	output signed [15:0] o_sound
);

parameter clock = 12000000;
logic [24:0][15:0] freq;
assign freq[0] = clock / 220;
assign freq[1] = clock / 233;
assign freq[2] = clock / 247;
assign freq[3] = clock / 262;
assign freq[4] = clock / 277;
assign freq[5] = clock / 294;
assign freq[6] = clock / 311;
assign freq[7] = clock / 330;
assign freq[8] = clock / 349;
assign freq[9] = clock / 370;
assign freq[10] = clock / 392;
assign freq[11] = clock / 415;
assign freq[12] = clock / 440;
assign freq[13] = clock / 466;
assign freq[14] = clock / 494;
assign freq[15] = clock / 523;
assign freq[16] = clock / 554;
assign freq[17] = clock / 587;
assign freq[18] = clock / 622;
assign freq[19] = clock / 659;
assign freq[20] = clock / 698;
assign freq[21] = clock / 740;
assign freq[22] = clock / 784;
assign freq[23] = clock / 831;
assign freq[24] = clock / 880;

logic [24:0][31:0] cnt_r, cnt_w;
logic [24:0][5:0] ramp_r, ramp_w;
logic signed [24:0][15:0] music;
logic [5:0] note_cnt;
assign o_sound = music[0]/32+music[1]/32+music[2]/32+music[3]/32+music[4]/32+music[5]/32+music[6]/32+music[7]/32+music[8]/32+music[9]/32+
				 music[10]/32+music[11]/32+music[12]/32+music[13]/32+music[14]/32+music[15]/32+music[16]/32+music[17]/32+music[18]/32+music[19]/32+music[20]/32+
				 music[21]/32+music[22]/32+music[23]/32+music[24]/32;

GenTimbre g1(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[0]),
	.o_music(music[0])
);
GenTimbre g2(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[1]),
	.o_music(music[1])
);
GenTimbre g3(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[2]),
	.o_music(music[2])
);
GenTimbre g4(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[3]),
	.o_music(music[3])
);
GenTimbre g5(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[4]),
	.o_music(music[4])
);
GenTimbre g6(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[5]),
	.o_music(music[5])
);
GenTimbre g7(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[6]),
	.o_music(music[6])
);
GenTimbre g8(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[7]),
	.o_music(music[7])
);
GenTimbre g9(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[8]),
	.o_music(music[8])
);
GenTimbre g10(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[9]),
	.o_music(music[9])
);
GenTimbre g11(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[10]),
	.o_music(music[10])
);
GenTimbre g12(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[11]),
	.o_music(music[11])
);
GenTimbre g13(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[12]),
	.o_music(music[12])
);
GenTimbre g14(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[13]),
	.o_music(music[13])
);
GenTimbre g15(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[14]),
	.o_music(music[14])
);
GenTimbre g16(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[15]),
	.o_music(music[15])
);
GenTimbre g17(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[16]),
	.o_music(music[16])
);
GenTimbre g18(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[17]),
	.o_music(music[17])
);
GenTimbre g19(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[18]),
	.o_music(music[18])
);
GenTimbre g20(
	.i_rst_n(i_rst_n),
	.i_synth_mode(i_synth_mode),
	.i_ramp(ramp_r[19]),
	.o_music(music[19])
);
GenTimbre g21(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[20]),
	.o_music(music[20])
);
GenTimbre g22(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[21]),
	.o_music(music[21])
);
GenTimbre g23(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[22]),
	.o_music(music[22])
);
GenTimbre g24(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[23]),
	.o_music(music[23])
);
GenTimbre g25(
	.i_clk(i_clk),
	.i_synth_mode(i_synth_mode),
	.i_rst_n(i_rst_n),
	.i_ramp(ramp_r[24]),
	.o_music(music[24])
);


always_comb begin
	for (int i=0; i<25; i++) begin
		if (cnt_r[i] + 1 == freq[i]) cnt_w[i] = 0;
		else cnt_w[i] = cnt_r[i] + 1;
	end
	for (int i=0; i<25; i++) begin
		ramp_w[i] = i_note[i] ? (cnt_r[i] * 64 / freq[i]) : 0;
	end
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		cnt_r <= '0;
		ramp_r <= '0;
	end
	else begin
		cnt_r <= cnt_w;
		ramp_r <= ramp_w;
		ramp_r <= ramp_w;
	end
end

endmodule
