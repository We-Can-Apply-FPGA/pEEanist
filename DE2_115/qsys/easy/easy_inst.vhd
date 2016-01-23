	component easy is
		port (
			clk_clk       : in  std_logic := 'X'; -- clk
			clk_100k_clk  : out std_logic;        -- clk
			clk_12m_clk   : out std_logic;        -- clk
			reset_reset_n : in  std_logic := 'X'; -- reset_n
			sdram_clk_clk : out std_logic         -- clk
		);
	end component easy;

	u0 : component easy
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --       clk.clk
			clk_100k_clk  => CONNECTED_TO_clk_100k_clk,  --  clk_100k.clk
			clk_12m_clk   => CONNECTED_TO_clk_12m_clk,   --   clk_12m.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, --     reset.reset_n
			sdram_clk_clk => CONNECTED_TO_sdram_clk_clk  -- sdram_clk.clk
		);

