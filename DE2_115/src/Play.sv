module Play(
	input i_bclk,
	input i_rst_n,
	
	input i_daclrck,
	output o_dacdat,
	
	input signed [15:0] i_sound
);

localparam CHANNEL_LENGTH = 16;
localparam S_LEFT = 0;
localparam S_RIGHT = 1;

logic [10:0] clk_r, clk_w;
logic state_r, state_w;

task audio;
begin
	if (clk_r > 0) begin
		o_dacdat = i_sound[clk_r - 1];
		clk_w = clk_r - 1;
	end
	else begin
		o_dacdat = 0;
	end
end
endtask

always_comb begin
	state_w = state_r;
	clk_w = clk_r;
	o_dacdat = 0;
	case(state_r)
		S_LEFT: begin
			audio();
			if (i_daclrck) begin
				state_w = S_RIGHT;
				clk_w = CHANNEL_LENGTH;
			end
		end
		S_RIGHT: begin
			audio();
			if (!i_daclrck) begin
				state_w = S_LEFT;
				clk_w = CHANNEL_LENGTH;
			end
		end
	endcase
end

always_ff @(negedge i_bclk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		clk_r <= 0;
		state_r <= S_LEFT;
	end
	else if (!i_bclk) begin
		clk_r <= clk_w;
		state_r <= state_w;
	end
end
endmodule
