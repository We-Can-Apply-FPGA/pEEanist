module DE2_115(
	input CLOCK_50,
	input CLOCK2_50,
	input CLOCK3_50,
	input ENETCLK_25,
	input SMA_CLKIN,
	output SMA_CLKOUT,
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
	output UART_CTS,
	input UART_RTS,
	input UART_RXD,
	output UART_TXD,
	inout PS2_CLK,
	inout PS2_DAT,
	inout PS2_CLK2,
	inout PS2_DAT2,
	output SD_CLK,
	inout SD_CMD,
	inout [3:0] SD_DAT,
	input SD_WP_N,
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
	output EEP_I2C_SCLK,
	inout EEP_I2C_SDAT,
	output I2C_SCLK,
	inout I2C_SDAT,
	output ENET0_GTX_CLK,
	input ENET0_INT_N,
	output ENET0_MDC,
	input ENET0_MDIO,
	output ENET0_RST_N,
	input ENET0_RX_CLK,
	input ENET0_RX_COL,
	input ENET0_RX_CRS,
	input [3:0] ENET0_RX_DATA,
	input ENET0_RX_DV,
	input ENET0_RX_ER,
	input ENET0_TX_CLK,
	output [3:0] ENET0_TX_DATA,
	output ENET0_TX_EN,
	output ENET0_TX_ER,
	input ENET0_LINK100,
	output ENET1_GTX_CLK,
	input ENET1_INT_N,
	output ENET1_MDC,
	input ENET1_MDIO,
	output ENET1_RST_N,
	input ENET1_RX_CLK,
	input ENET1_RX_COL,
	input ENET1_RX_CRS,
	input [3:0] ENET1_RX_DATA,
	input ENET1_RX_DV,
	input ENET1_RX_ER,
	input ENET1_TX_CLK,
	output [3:0] ENET1_TX_DATA,
	output ENET1_TX_EN,
	output ENET1_TX_ER,
	input ENET1_LINK100,
	input TD_CLK27,
	input [7:0] TD_DATA,
	input TD_HS,
	output TD_RESET_N,
	input TD_VS,
	inout [15:0] OTG_DATA,
	output [1:0] OTG_ADDR,
	output OTG_CS_N,
	output OTG_WR_N,
	output OTG_RD_N,
	input OTG_INT,
	output OTG_RST_N,
	input IRDA_RXD,
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
	output [19:0] SRAM_ADDR,
	output SRAM_CE_N,
	inout [15:0] SRAM_DQ,
	output SRAM_LB_N,
	output SRAM_OE_N,
	output SRAM_UB_N,
	output SRAM_WE_N,
	output [22:0] FL_ADDR,
	output FL_CE_N,
	inout [7:0] FL_DQ,
	output FL_OE_N,
	output FL_RST_N,
	input FL_RY,
	output FL_WE_N,
	output FL_WP_N,
	inout [35:0] GPIO,
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

logic [24:0] GPI;
logic [24:0] GPO;

//assign GPIO[35:18] = 'bz;
//assign HSMC_RX_D_P[16:10] = 'bz;

assign {HSMC_TX_D_P[10], HSMC_TX_D_P[11], HSMC_TX_D_P[12], HSMC_TX_D_P[13], HSMC_TX_D_P[14], HSMC_TX_D_P[15], HSMC_TX_D_P[16], GPIO[12], GPIO[14], GPIO[16], GPIO[10], GPIO[8], GPIO[6], GPIO[4], GPIO[2], GPIO[0], GPIO[17], GPIO[15], GPIO[13], GPIO[11], GPIO[9], GPIO[7], GPIO[5], GPIO[3], GPIO[1]} = GPO[24:0];

assign GPI[24:0] = {HSMC_RX_D_P[10], HSMC_RX_D_P[11], HSMC_RX_D_P[12], HSMC_RX_D_P[13], HSMC_RX_D_P[14], HSMC_RX_D_P[15], HSMC_RX_D_P[16], GPIO[30], GPIO[32], GPIO[34], GPIO[28], GPIO[26], GPIO[24], GPIO[22], GPIO[20], GPIO[18], GPIO[35], GPIO[33], GPIO[31], GPIO[29], GPIO[27], GPIO[25], GPIO[23], GPIO[21], GPIO[19]};


logic clk_100k, clk_12m, reset_n, clk_down;
logic source_valid, source_ready, source_sop, source_eop;
logic sink_valid, sink_sop, sink_eop;
logic listening, init_finish;
logic signed [15:0] sink_real, sink_imag;
logic signed [15:0] play_sound, listen_sound;
logic [24:0] note;
logic [31:0] pc;
logic [9:0] fft_cnt;
logic [24:0] fft_note;
logic [31:0] fft_power;
logic [5:0] sink_exp;
assign LCD_ON = 0;
assign LCD_BLON = 1;
assign AUD_XCK = clk_12m;


assign note = listening ? fft_note : ~GPI[24:0];
assign GPO[24:0] = ~note;
assign LEDR = {(real_2 + imag_2) >> 15};
assign LEDG = {sink_exp};
assign listening = SW[0];

easy core (
	.clk_clk(CLOCK_50),
	//.pc_export(pc),
	.reset_reset_n(reset_n & init_finish),
	.clk_100k_clk(clk_100k),
	.clk_12m_clk(clk_12m),
	
	/*
	.sram_DQ(SRAM_DQ),
	.sram_ADDR(SRAM_ADDR),
	.sram_LB_N(SRAM_LB_N),
	.sram_UB_N(SRAM_UB_N),
	.sram_CE_N(SRAM_CE_N),
	.sram_OE_N(SRAM_OE_N),
	.sram_WE_N(SRAM_WE_N),
	.debug_export(real_2 + imag_2)
	.lcd_data(LCD_DATA),
	.lcd_E(LCD_EN),
	.lcd_RS(LCD_RS),
	.lcd_RW(LCD_RW),
	.sdram_addr(DRAM_ADDR),
	.sdram_ba(DRAM_BA),
	.sdram_cas_n(DRAM_CAS_N),
	.sdram_cke(DRAM_CKE),
	.sdram_cs_n(DRAM_CS_N),
	.sdram_dq(DRAM_DQ),
	.sdram_dqm(DRAM_DQM),
	.sdram_ras_n(DRAM_RAS_N),
	.sdram_we_n(DRAM_WE_N),
	.sdram_clk_clk(DRAM_CLK),
	
	.rs232_rxd(UART_RXD),
	.rs232_txd(UART_TXD)
	*/
);

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
	
	.i_sound(play_sound + listen_sound)
);

Listen listen(
	.i_bclk(AUD_BCLK),
	.i_rst_n(reset_n & init_finish & listening),
	.i_adclrck(AUD_ADCLRCK),
	.i_adcdat(AUD_ADCDAT),
	.o_sound(listen_sound)
);

DownSample down_sample(
	.i_clk(AUD_ADCLRCK),
	.i_rst_n(reset_n & init_finish & listening),
	.o_clk(clk_down)
);


ToFFT tofft(
	.i_clk(clk_down),
	.i_reset_n(reset_n & init_finish & listening),
	.o_source_valid(source_valid),
	.i_source_ready(source_ready),
	.o_source_sop(source_sop),
	.o_source_eop(source_eop)
);


FFT fft(
	.clk(clk_down),
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

CountFFT count_fft(
	.i_clk(clk_down),
	.i_rst_n(reset_n & init_finish & listening),
	.i_valid(sink_valid),
	.o_fft_cnt(fft_cnt)
);

logic [31:0] real_2, imag_2;
assign real_2 = ((sink_real/2) * (sink_real/2)) >> (sink_exp[3:0] * 2 - 14);
assign imag_2 = ((sink_imag/2) * (sink_imag/2)) >> (sink_exp[3:0] * 2 - 14);

HPS hps(
	.i_clk(clk_down),
	.i_rst_n(reset_n & init_finish & listening),
	.i_cnt(fft_cnt),
	.i_square_add(real_2 + imag_2),
	.o_note(fft_note),
	.o_power(fft_power)
);
/*
Synthesizer synth (
	.i_clk(AUD_BCLK),
	.i_rst_n(reset_n & init_finish),
	.i_note(note),
	.i_synth_mode(SW[0]),
	.o_sound(play_sound)
);
*/
Debounce reset (
	.i_in(KEY[0]),
	.i_clk(AUD_BCLK),
	.o_debounced(reset_n)
);
endmodule
