	component easy is
		port (
			clk_clk                      : in  std_logic                     := 'X';             -- clk
			clk_100k_clk                 : out std_logic;                                        -- clk
			clk_12m_clk                  : out std_logic;                                        -- clk
			reset_reset_n                : in  std_logic                     := 'X';             -- reset_n
			sdram_clk_clk                : out std_logic;                                        -- clk
			pll_areset_conduit_export    : in  std_logic                     := 'X';             -- export
			pll_locked_conduit_export    : out std_logic;                                        -- export
			pll_phasedone_conduit_export : out std_logic;                                        -- export
			pll_pll_slave_read           : in  std_logic                     := 'X';             -- read
			pll_pll_slave_write          : in  std_logic                     := 'X';             -- write
			pll_pll_slave_address        : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- address
			pll_pll_slave_readdata       : out std_logic_vector(31 downto 0);                    -- readdata
			pll_pll_slave_writedata      : in  std_logic_vector(31 downto 0) := (others => 'X')  -- writedata
		);
	end component easy;

	u0 : component easy
		port map (
			clk_clk                      => CONNECTED_TO_clk_clk,                      --                   clk.clk
			clk_100k_clk                 => CONNECTED_TO_clk_100k_clk,                 --              clk_100k.clk
			clk_12m_clk                  => CONNECTED_TO_clk_12m_clk,                  --               clk_12m.clk
			reset_reset_n                => CONNECTED_TO_reset_reset_n,                --                 reset.reset_n
			sdram_clk_clk                => CONNECTED_TO_sdram_clk_clk,                --             sdram_clk.clk
			pll_areset_conduit_export    => CONNECTED_TO_pll_areset_conduit_export,    --    pll_areset_conduit.export
			pll_locked_conduit_export    => CONNECTED_TO_pll_locked_conduit_export,    --    pll_locked_conduit.export
			pll_phasedone_conduit_export => CONNECTED_TO_pll_phasedone_conduit_export, -- pll_phasedone_conduit.export
			pll_pll_slave_read           => CONNECTED_TO_pll_pll_slave_read,           --         pll_pll_slave.read
			pll_pll_slave_write          => CONNECTED_TO_pll_pll_slave_write,          --                      .write
			pll_pll_slave_address        => CONNECTED_TO_pll_pll_slave_address,        --                      .address
			pll_pll_slave_readdata       => CONNECTED_TO_pll_pll_slave_readdata,       --                      .readdata
			pll_pll_slave_writedata      => CONNECTED_TO_pll_pll_slave_writedata       --                      .writedata
		);

