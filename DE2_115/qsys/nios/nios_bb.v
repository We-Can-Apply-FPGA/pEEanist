
module nios (
	clk_clk,
	clk_100k_clk,
	clk_12m_clk,
	fft_img_export,
	fft_real_export,
	fft_start_export,
	lcd_RS,
	lcd_RW,
	lcd_data,
	lcd_E,
	pc_export,
	reset_reset_n,
	rs232_rxd,
	rs232_txd,
	rs232_cts_n,
	rs232_rts_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	sdram_clk_clk,
	sram_DQ,
	sram_ADDR,
	sram_LB_N,
	sram_UB_N,
	sram_CE_N,
	sram_OE_N,
	sram_WE_N,
	fft_cnt_export);	

	input		clk_clk;
	output		clk_100k_clk;
	output		clk_12m_clk;
	input	[23:0]	fft_img_export;
	input	[23:0]	fft_real_export;
	input		fft_start_export;
	output		lcd_RS;
	output		lcd_RW;
	inout	[7:0]	lcd_data;
	output		lcd_E;
	output	[31:0]	pc_export;
	input		reset_reset_n;
	input		rs232_rxd;
	output		rs232_txd;
	input		rs232_cts_n;
	output		rs232_rts_n;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[31:0]	sdram_dq;
	output	[3:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	output		sdram_clk_clk;
	inout	[15:0]	sram_DQ;
	output	[19:0]	sram_ADDR;
	output		sram_LB_N;
	output		sram_UB_N;
	output		sram_CE_N;
	output		sram_OE_N;
	output		sram_WE_N;
	input	[9:0]	fft_cnt_export;
endmodule
