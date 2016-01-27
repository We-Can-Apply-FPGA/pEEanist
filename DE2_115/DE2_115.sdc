create_clock -period 20 [get_ports CLOCK_50]
create_clock -period 20 [get_ports CLOCK2_50]
create_clock -period 20 [get_ports CLOCK3_50]
create_clock -period 83 [get_ports AUD_BCLK]
derive_pll_clocks
derive_clock_uncertainty
set_input_delay 0 -clock [get_clocks CLOCK_50] [all_inputs]
set_output_delay 0 -clock [get_clocks CLOCK_50] [all_outputs]