	component nios is
		port (
			clk_clk          : in    std_logic                     := 'X';             -- clk
			clk_100k_clk     : out   std_logic;                                        -- clk
			clk_12m_clk      : out   std_logic;                                        -- clk
			fft_img_export   : in    std_logic_vector(23 downto 0) := (others => 'X'); -- export
			fft_real_export  : in    std_logic_vector(23 downto 0) := (others => 'X'); -- export
			fft_start_export : in    std_logic                     := 'X';             -- export
			lcd_RS           : out   std_logic;                                        -- RS
			lcd_RW           : out   std_logic;                                        -- RW
			lcd_data         : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			lcd_E            : out   std_logic;                                        -- E
			pc_export        : out   std_logic_vector(31 downto 0);                    -- export
			reset_reset_n    : in    std_logic                     := 'X';             -- reset_n
			rs232_rxd        : in    std_logic                     := 'X';             -- rxd
			rs232_txd        : out   std_logic;                                        -- txd
			rs232_cts_n      : in    std_logic                     := 'X';             -- cts_n
			rs232_rts_n      : out   std_logic;                                        -- rts_n
			sdram_addr       : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_ba         : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n      : out   std_logic;                                        -- cas_n
			sdram_cke        : out   std_logic;                                        -- cke
			sdram_cs_n       : out   std_logic;                                        -- cs_n
			sdram_dq         : inout std_logic_vector(31 downto 0) := (others => 'X'); -- dq
			sdram_dqm        : out   std_logic_vector(3 downto 0);                     -- dqm
			sdram_ras_n      : out   std_logic;                                        -- ras_n
			sdram_we_n       : out   std_logic;                                        -- we_n
			sdram_clk_clk    : out   std_logic;                                        -- clk
			sram_DQ          : inout std_logic_vector(15 downto 0) := (others => 'X'); -- DQ
			sram_ADDR        : out   std_logic_vector(19 downto 0);                    -- ADDR
			sram_LB_N        : out   std_logic;                                        -- LB_N
			sram_UB_N        : out   std_logic;                                        -- UB_N
			sram_CE_N        : out   std_logic;                                        -- CE_N
			sram_OE_N        : out   std_logic;                                        -- OE_N
			sram_WE_N        : out   std_logic;                                        -- WE_N
			fft_cnt_export   : in    std_logic_vector(9 downto 0)  := (others => 'X')  -- export
		);
	end component nios;

	u0 : component nios
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --       clk.clk
			clk_100k_clk     => CONNECTED_TO_clk_100k_clk,     --  clk_100k.clk
			clk_12m_clk      => CONNECTED_TO_clk_12m_clk,      --   clk_12m.clk
			fft_img_export   => CONNECTED_TO_fft_img_export,   --   fft_img.export
			fft_real_export  => CONNECTED_TO_fft_real_export,  --  fft_real.export
			fft_start_export => CONNECTED_TO_fft_start_export, -- fft_start.export
			lcd_RS           => CONNECTED_TO_lcd_RS,           --       lcd.RS
			lcd_RW           => CONNECTED_TO_lcd_RW,           --          .RW
			lcd_data         => CONNECTED_TO_lcd_data,         --          .data
			lcd_E            => CONNECTED_TO_lcd_E,            --          .E
			pc_export        => CONNECTED_TO_pc_export,        --        pc.export
			reset_reset_n    => CONNECTED_TO_reset_reset_n,    --     reset.reset_n
			rs232_rxd        => CONNECTED_TO_rs232_rxd,        --     rs232.rxd
			rs232_txd        => CONNECTED_TO_rs232_txd,        --          .txd
			rs232_cts_n      => CONNECTED_TO_rs232_cts_n,      --          .cts_n
			rs232_rts_n      => CONNECTED_TO_rs232_rts_n,      --          .rts_n
			sdram_addr       => CONNECTED_TO_sdram_addr,       --     sdram.addr
			sdram_ba         => CONNECTED_TO_sdram_ba,         --          .ba
			sdram_cas_n      => CONNECTED_TO_sdram_cas_n,      --          .cas_n
			sdram_cke        => CONNECTED_TO_sdram_cke,        --          .cke
			sdram_cs_n       => CONNECTED_TO_sdram_cs_n,       --          .cs_n
			sdram_dq         => CONNECTED_TO_sdram_dq,         --          .dq
			sdram_dqm        => CONNECTED_TO_sdram_dqm,        --          .dqm
			sdram_ras_n      => CONNECTED_TO_sdram_ras_n,      --          .ras_n
			sdram_we_n       => CONNECTED_TO_sdram_we_n,       --          .we_n
			sdram_clk_clk    => CONNECTED_TO_sdram_clk_clk,    -- sdram_clk.clk
			sram_DQ          => CONNECTED_TO_sram_DQ,          --      sram.DQ
			sram_ADDR        => CONNECTED_TO_sram_ADDR,        --          .ADDR
			sram_LB_N        => CONNECTED_TO_sram_LB_N,        --          .LB_N
			sram_UB_N        => CONNECTED_TO_sram_UB_N,        --          .UB_N
			sram_CE_N        => CONNECTED_TO_sram_CE_N,        --          .CE_N
			sram_OE_N        => CONNECTED_TO_sram_OE_N,        --          .OE_N
			sram_WE_N        => CONNECTED_TO_sram_WE_N,        --          .WE_N
			fft_cnt_export   => CONNECTED_TO_fft_cnt_export    --   fft_cnt.export
		);

