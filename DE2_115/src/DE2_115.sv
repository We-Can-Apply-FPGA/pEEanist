module DE2_115(
	input CLOCK_50,
	output [8:0] LEDG,
	output [17:0] LEDR,
	input [3:0] KEY,
	input [17:0] SW,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [6:0] HEX6,
	output [6:0] HEX7,
	output LCD_BLON,
	inout [7:0] LCD_DATA,
	output LCD_EN,
	output LCD_ON,
	output LCD_RS,
	output LCD_RW,
	output [7:0] VGA_B,
	output VGA_BLANK_N,
	output VGA_CLK,
	output [7:0] VGA_G,
	output VGA_HS,
	output [7:0] VGA_R,
	output VGA_SYNC_N,
	output VGA_VS,
	input AUD_ADCDAT,
	inout AUD_ADCLRCK,
	inout AUD_BCLK,
	output AUD_DACDAT,
	inout AUD_DACLRCK,
	output AUD_XCK,
	output I2C_SCLK,
	inout I2C_SDAT,
	output [12:0] DRAM_ADDR,
	output [1:0] DRAM_BA,
	output DRAM_CAS_N,
	output DRAM_CKE,
	output DRAM_CLK,
	output DRAM_CS_N,
	inout [31:0] DRAM_DQ,
	output [3:0] DRAM_DQM,
	output DRAM_RAS_N,
	output DRAM_WE_N,
	inout [35:0] GPIO,
	output [19:0] SRAM_ADDR,
	output SRAM_CE_N,
	inout [15:0] SRAM_DQ,
	output SRAM_LB_N,
	output SRAM_OE_N,
	output SRAM_UB_N,
	output SRAM_WE_N,
	input HSMC_CLKIN_P1,
	input HSMC_CLKIN_P2,
	input HSMC_CLKIN0,
	output HSMC_CLKOUT_P1,
	output HSMC_CLKOUT_P2,
	output HSMC_CLKOUT0,
	inout [3:0] HSMC_D,
	input [16:0] HSMC_RX_D_P,
	output [16:0] HSMC_TX_D_P,
	inout [6:0] EX_IO
);

logic [24:0] G, GPI;
logic [24:0] GPO;

assign {HSMC_TX_D_P[10], HSMC_TX_D_P[11], HSMC_TX_D_P[12], HSMC_TX_D_P[13], HSMC_TX_D_P[14], HSMC_TX_D_P[15], HSMC_TX_D_P[16], GPIO[12], GPIO[14], GPIO[16], GPIO[10], GPIO[8], GPIO[6], GPIO[4], GPIO[2], GPIO[0], GPIO[17], GPIO[15], GPIO[13], GPIO[11], GPIO[9], GPIO[7], GPIO[5], GPIO[3], GPIO[1]} = GPO[24:0];
assign G[24:0] = {HSMC_RX_D_P[10], HSMC_RX_D_P[11], HSMC_RX_D_P[12], HSMC_RX_D_P[13], HSMC_RX_D_P[14], HSMC_RX_D_P[15], HSMC_RX_D_P[16], GPIO[30], GPIO[32], GPIO[34], GPIO[28], GPIO[26], GPIO[24], GPIO[22], GPIO[20], GPIO[18], GPIO[35], GPIO[33], GPIO[31], GPIO[29], GPIO[27], GPIO[25], GPIO[23], GPIO[21], GPIO[19]};
assign LCD_ON = 0;
assign LCD_BLON = 1;
assign AUD_XCK = clk_12m;

logic clk_100k, clk_12m, reset_n;
logic listening, teaching, init_finish;
logic signed [15:0] play_sound, listen_sound;
logic [24:0] fft_note, teaching_note, note;
assign listening = SW[0];
assign teaching = SW[1];

assign note = listening ? fft_note : (teaching ? teaching_note : ~GPI[24:0]);
assign GPO[24:0] = ~note;
assign LEDG[7:0] = SW[2] ? debug[31:26] : debug[7:0];
assign LEDR = SW[2] ? 0 : debug[25:8];


easy core (
	.clk_clk(CLOCK_50),
	.reset_reset_n(reset_n & init_finish),
	.clk_100k_clk(clk_100k),
	.clk_12m_clk(clk_12m)
);
/*
assign VGA_CLK   = ~CLOCK_50;

VGA_SET vga_set(
	.CLK_to_DAC(CLOCK_50),
	.VGA_R(VGA_R),
	.VGA_G(VGA_G),
	.VGA_B(VGA_B),
	.VGA_HS(VGA_HS),
	.VGA_VS(VGA_VS),
	.VGA_BLANK_N(VGA_BLANK_N),
	.VGA_SYNC_N(VGA_SYNC_N),
	.RST_N(KEY[0]),
	.Ctrl(~GPI)
);*/

SetCodec init(
	.i_clk(clk_100k),
	.i_rst_n(reset_n),
	.o_sclk(I2C_SCLK),
	.io_sdat(I2C_SDAT),
	.o_init_finish(init_finish)
);

Play play(
	.i_bclk(AUD_BCLK),
	.i_rst_n(reset_n & init_finish),
	
	.i_daclrck(AUD_DACLRCK),
	.o_dacdat(AUD_DACDAT),
	
	.i_sound(play_sound)
);
//assign AUD_DACDAT = AUD_ADCDAT;

Listen listen(
	.i_bclk(AUD_BCLK),
	.i_rst_n(reset_n & init_finish & listening),
	.i_adclrck(AUD_ADCLRCK),
	.i_adcdat(AUD_ADCDAT),
	.o_sound(listen_sound)
);


Teaching teach(
	.i_clk(CLOCK_50),
	.i_rst_n(reset_n & teaching),
	.GPI(~GPI),
	.o_note(teaching_note),
	.o_ok(LEDG[8])
);

ToFFT tofft(
	.i_clk(AUD_ADCLRCK),
	.i_reset_n(reset_n & init_finish & listening),
	.o_source_valid(source_valid),
	.i_source_ready(source_ready),
	.o_source_sop(source_sop),
	.o_source_eop(source_eop)
);

logic [10:0] fft_cnt;

CountFFT count_fft(
	.i_clk(AUD_ADCLRCK),
	.i_rst_n(reset_n & init_finish & listening),
	.i_valid(sink_valid),
	.o_fft_cnt(fft_cnt)
);

logic source_valid, source_ready, source_sop, source_eop;
logic sink_valid, sink_ready, sink_sop, sink_eop;
logic signed [15:0] source_real, sink_real, sink_imag;
logic [5:0] sink_exp;

FFT fft(
	.clk(AUD_ADCLRCK),
	.reset_n(reset_n & init_finish & listening),
	.sink_valid(source_valid),
	.sink_ready(source_ready),
	.sink_error(0),
	.sink_sop(source_sop),
	.sink_eop(source_eop),
	.sink_real(listen_sound),
	.sink_imag(0),
	.inverse(0),
	.source_valid(sink_valid),
	.source_ready(1),
	.source_sop(sink_sop),
	.source_eop(sink_eop),
	.source_exp(sink_exp),
	.source_real(sink_real),
	.source_imag(sink_imag)
);
logic signed [63:0] real_2, imag_2;
logic signed [31:0] real_2_imag_2;
logic signed [31:0] debug, debug_hps, debug_r, debug_w, max;

assign real_2 = sink_exp[5] ? ((sink_real*sink_real) >> (2*sink_exp[3:0])): 0;
assign imag_2 = sink_exp[5] ? ((sink_imag*sink_imag) >> (2*sink_exp[3:0])) : 0;
assign real_2_imag_2 = real_2 + imag_2;
assign debug = debug_r;

always_comb begin
	debug_w = debug_r;
	if (!SW[17]) debug_w = real_2_imag_2;
	else if (SW[17]) debug_w = max;
end

always_ff @(posedge CLOCK_50 or negedge reset_n) begin
	if (!reset_n) begin
		debug_r <= 0;
	end
	else begin
		debug_r <= debug_w;
	end
end

HPS hps(
	.i_clk(AUD_ADCLRCK),
	.i_rst_n(reset_n & init_finish & listening),
	.i_cnt(fft_cnt),
	.i_square_add(real_2_imag_2),
	.i_multi(SW[16:3]),
	.o_note(fft_note),
	.o_debug(debug_hps),
	.o_debug_max(max)
);

/*
Synthesizer synth (
	.i_clk(AUD_BCLK),
	.i_rst_n(reset_n & init_finish),
	.i_note((teaching ? ~GPI : note)),
	.i_synth_mode(SW[17]),
	.o_sound(play_sound)
);
*/
Debounce i0(
	.i_in(G[0]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[0])
);
Debounce i1(
	.i_in(G[1]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[1])
);

Debounce i2(
	.i_in(G[2]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[2])
);

Debounce i3(
	.i_in(G[3]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[3])
);

Debounce i4(
	.i_in(G[4]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[4])
);

Debounce i5(
	.i_in(G[5]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[5])
);

Debounce i6(
	.i_in(G[6]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[6])
);

Debounce i7(
	.i_in(G[7]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[7])
);

Debounce i8(
	.i_in(G[8]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[8])
);

Debounce i9(
	.i_in(G[9]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[9])
);

Debounce i10(
	.i_in(G[10]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[10])
);

Debounce i11(
	.i_in(G[11]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[11])
);

Debounce i12(
	.i_in(G[12]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[12])
);

Debounce i13(
	.i_in(G[13]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[13])
);

Debounce i14(
	.i_in(G[14]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[14])
);

Debounce i15(
	.i_in(G[15]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[15])
);

Debounce i16(
	.i_in(G[16]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[16])
);

Debounce i17(
	.i_in(G[17]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[17])
);

Debounce i18(
	.i_in(G[18]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[18])
);

Debounce i19(
	.i_in(G[19]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[19])
);

Debounce i20(
	.i_in(G[20]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[20])
);

Debounce i21(
	.i_in(G[21]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[21])
);

Debounce i22(
	.i_in(G[22]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[22])
);

Debounce i23(
	.i_in(G[23]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[23])
);

Debounce i24(
	.i_in(G[24]),
	.i_clk(CLOCK_50),
	.o_debounced(GPI[24])
);

Debounce reset (
	.i_in(KEY[0]),
	.i_clk(CLOCK_50),
	.o_debounced(reset_n)
);

endmodule
