module CountFFT(
	input i_clk,
	input i_rst_n,
	
	input i_valid,
	
	output [9:0] o_fft_cnt
);

logic [9:0] fft_cnt_r, fft_cnt_w;
logic start_r, start_w;
assign o_fft_cnt = fft_cnt_r;

always_comb begin
	fft_cnt_w = fft_cnt_r;
	start_w = start_r;
	if (start_r) fft_cnt_w = (fft_cnt_r+1)%1024;
	if (i_valid) start_w = 1;
end	

always_ff @(negedge i_clk or negedge i_rst_n) begin
	if (!i_rst_n) begin
		start_r <= 0;
		fft_cnt_r <= 0;
	end
	else begin
		start_r <= start_w;
		fft_cnt_r <= fft_cnt_w;
	end
end
endmodule