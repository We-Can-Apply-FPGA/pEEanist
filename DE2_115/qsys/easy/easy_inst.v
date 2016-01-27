	easy u0 (
		.clk_clk                      (<connected-to-clk_clk>),                      //                   clk.clk
		.clk_100k_clk                 (<connected-to-clk_100k_clk>),                 //              clk_100k.clk
		.clk_12m_clk                  (<connected-to-clk_12m_clk>),                  //               clk_12m.clk
		.reset_reset_n                (<connected-to-reset_reset_n>),                //                 reset.reset_n
		.sdram_clk_clk                (<connected-to-sdram_clk_clk>),                //             sdram_clk.clk
		.pll_areset_conduit_export    (<connected-to-pll_areset_conduit_export>),    //    pll_areset_conduit.export
		.pll_locked_conduit_export    (<connected-to-pll_locked_conduit_export>),    //    pll_locked_conduit.export
		.pll_phasedone_conduit_export (<connected-to-pll_phasedone_conduit_export>), // pll_phasedone_conduit.export
		.pll_pll_slave_read           (<connected-to-pll_pll_slave_read>),           //         pll_pll_slave.read
		.pll_pll_slave_write          (<connected-to-pll_pll_slave_write>),          //                      .write
		.pll_pll_slave_address        (<connected-to-pll_pll_slave_address>),        //                      .address
		.pll_pll_slave_readdata       (<connected-to-pll_pll_slave_readdata>),       //                      .readdata
		.pll_pll_slave_writedata      (<connected-to-pll_pll_slave_writedata>)       //                      .writedata
	);

