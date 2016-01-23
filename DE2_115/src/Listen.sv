module Listen(
	input i_bclk,
	input i_rst_n,
	
	input i_adclrck,
	input i_clk_down,
	input i_adcdat,
	
	output [15:0] o_sound
);

localparam CHANNEL_LENGTH = 16;
localparam S_LEFT = 0;
localparam S_RIGHT = 1;

logic [10:0] clk_r, clk_w;
logic [15:0] sound_r, sound_w, o_sound_r, o_sound_w;
logic state_r, state_w;

assign o_sound = o_sound_r;

always_comb begin
	state_w = state_r;
	clk_w = clk_r;
	sound_w = sound_r;
	o_sound_w = o_sound_r;
	case(state_r)
		S_LEFT: begin
			if (clk_r > 0) begin
				sound_w = (sound_r << 1) + i_adcdat;
				clk_w = clk_r - 1;
			end
			else begin
				o_sound_w = sound_r;
			end
			if (i_adclrck) begin
				sound_w = 0;
				state_w = S_RIGHT;
				clk_w = CHANNEL_LENGTH;
			end
		end
		S_RIGHT: begin
			if (clk_r > 0) begin
				sound_w = (sound_r << 1) + i_adcdat;
				clk_w = clk_r - 1;
			end
			else begin
				o_sound_w = sound_r;
			end
			if (!i_adclrck) begin
				sound_w = 0;
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
		sound_r = 0;
		o_sound_r <= 0;
	end
	else if (!i_bclk) begin
		clk_r <= clk_w;
		state_r <= state_w;
		sound_r <= sound_w;
		o_sound_r <= o_sound_w;
	end
end
endmodule