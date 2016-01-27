
module easy (
	clk_clk,
	clk_100k_clk,
	clk_12m_clk,
	reset_reset_n,
	sdram_clk_clk,
	pll_areset_conduit_export,
	pll_locked_conduit_export,
	pll_phasedone_conduit_export,
	pll_pll_slave_read,
	pll_pll_slave_write,
	pll_pll_slave_address,
	pll_pll_slave_readdata,
	pll_pll_slave_writedata);	

	input		clk_clk;
	output		clk_100k_clk;
	output		clk_12m_clk;
	input		reset_reset_n;
	output		sdram_clk_clk;
	input		pll_areset_conduit_export;
	output		pll_locked_conduit_export;
	output		pll_phasedone_conduit_export;
	input		pll_pll_slave_read;
	input		pll_pll_slave_write;
	input	[1:0]	pll_pll_slave_address;
	output	[31:0]	pll_pll_slave_readdata;
	input	[31:0]	pll_pll_slave_writedata;
endmodule
