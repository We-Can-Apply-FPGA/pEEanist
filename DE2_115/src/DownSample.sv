module DownSample(
	input i_clk,
	input i_rst_n,
	
	output o_clk
);

logic cnt_r, cnt_w;
assign o_clk = cnt_r;

always_comb begin
	cnt_w = !cnt_r;
end

always_ff @(negedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		cnt_r <= 0;
	end
	else begin
		cnt_r <= cnt_w;
	end
end
endmodule
