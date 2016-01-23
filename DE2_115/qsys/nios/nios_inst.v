	nios u0 (
		.clk_clk          (<connected-to-clk_clk>),          //       clk.clk
		.clk_100k_clk     (<connected-to-clk_100k_clk>),     //  clk_100k.clk
		.clk_12m_clk      (<connected-to-clk_12m_clk>),      //   clk_12m.clk
		.fft_img_export   (<connected-to-fft_img_export>),   //   fft_img.export
		.fft_real_export  (<connected-to-fft_real_export>),  //  fft_real.export
		.fft_start_export (<connected-to-fft_start_export>), // fft_start.export
		.lcd_RS           (<connected-to-lcd_RS>),           //       lcd.RS
		.lcd_RW           (<connected-to-lcd_RW>),           //          .RW
		.lcd_data         (<connected-to-lcd_data>),         //          .data
		.lcd_E            (<connected-to-lcd_E>),            //          .E
		.pc_export        (<connected-to-pc_export>),        //        pc.export
		.reset_reset_n    (<connected-to-reset_reset_n>),    //     reset.reset_n
		.rs232_rxd        (<connected-to-rs232_rxd>),        //     rs232.rxd
		.rs232_txd        (<connected-to-rs232_txd>),        //          .txd
		.rs232_cts_n      (<connected-to-rs232_cts_n>),      //          .cts_n
		.rs232_rts_n      (<connected-to-rs232_rts_n>),      //          .rts_n
		.sdram_addr       (<connected-to-sdram_addr>),       //     sdram.addr
		.sdram_ba         (<connected-to-sdram_ba>),         //          .ba
		.sdram_cas_n      (<connected-to-sdram_cas_n>),      //          .cas_n
		.sdram_cke        (<connected-to-sdram_cke>),        //          .cke
		.sdram_cs_n       (<connected-to-sdram_cs_n>),       //          .cs_n
		.sdram_dq         (<connected-to-sdram_dq>),         //          .dq
		.sdram_dqm        (<connected-to-sdram_dqm>),        //          .dqm
		.sdram_ras_n      (<connected-to-sdram_ras_n>),      //          .ras_n
		.sdram_we_n       (<connected-to-sdram_we_n>),       //          .we_n
		.sdram_clk_clk    (<connected-to-sdram_clk_clk>),    // sdram_clk.clk
		.sram_DQ          (<connected-to-sram_DQ>),          //      sram.DQ
		.sram_ADDR        (<connected-to-sram_ADDR>),        //          .ADDR
		.sram_LB_N        (<connected-to-sram_LB_N>),        //          .LB_N
		.sram_UB_N        (<connected-to-sram_UB_N>),        //          .UB_N
		.sram_CE_N        (<connected-to-sram_CE_N>),        //          .CE_N
		.sram_OE_N        (<connected-to-sram_OE_N>),        //          .OE_N
		.sram_WE_N        (<connected-to-sram_WE_N>),        //          .WE_N
		.fft_cnt_export   (<connected-to-fft_cnt_export>)    //   fft_cnt.export
	);

