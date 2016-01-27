module ToFFT(
	input  i_clk,
	input  i_reset_n,
	input  i_source_ready,
	output o_source_valid,
	output o_source_sop,
	output o_source_eop
);

//logic source_sop_r,source_sop_w;
//logic source_eop_r,source_eop_w;
//logic source_valid_r,source_valid_w;
//logic[1:0] state_r,state_w;
logic[9:0] cnt_r,cnt_w;


localparam TOT_DAT = 2048;

assign o_source_valid = i_reset_n;
assign o_source_eop = ((cnt_r == (TOT_DAT-1)) && i_reset_n);
assign o_source_sop = (cnt_r == 0 && i_reset_n);

always_comb begin
	if(i_source_ready) cnt_w = (cnt_r + 1) % TOT_DAT;
	else cnt_w = 0;
	
end

always_ff @(posedge i_clk or negedge i_reset_n) begin
	if (!i_reset_n) begin
		cnt_r <= 0;
	end
	else begin
		cnt_r <= cnt_w;
	end
end
endmodule
