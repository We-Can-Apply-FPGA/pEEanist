module GenTimbre(
	input i_synth_mode,
	input i_clk,
	input i_rst_n,
	input [5:0] i_ramp,
	
	output [15:0] o_music
);
always_comb begin
	if(i_synth_mode) begin
		case(i_ramp[5:0])
			0 :o_music = 16'h0;
			1 :o_music = 16'h0;
			2 :o_music = 16'h0;
			3 :o_music = 16'h0;
			4 :o_music = 16'h0;
			5 :o_music = 16'h0;
			6 :o_music = 16'h246;
			7 :o_music = 16'hC36;
			8 :o_music = 16'hCFC;
			9 :o_music = 16'hC17;
			10 :o_music = 16'hAEE;
			11 :o_music = 16'hAA0;
			12 :o_music = 16'hBB8;
			13 :o_music = 16'hBAE;
			14 :o_music = 16'h9E4;
			15 :o_music = 16'h834;
			16 :o_music = 16'h789;
			17 :o_music = 16'hA89;
			18 :o_music = 16'h115A;
			19 :o_music = 16'h19D4;
			20 :o_music = 16'h2316;
			21 :o_music = 16'h2825;
			22 :o_music = 16'h24BA;
			23 :o_music = 16'h1D2E;
			24 :o_music = 16'h143B;
			25 :o_music = 16'hE10;
			26 :o_music = 16'h1345;
			27 :o_music = 16'h1E4B;
			28 :o_music = 16'h2392;
			29 :o_music = 16'h1E0A;
			30 :o_music = 16'hF4A;
			31 :o_music = 16'h37F;
			32 :o_music = 16'h1E0;
			33 :o_music = 16'h560;
			34 :o_music = 16'h9B7;
			35 :o_music = 16'hF84;
			36 :o_music = 16'h16D8;
			37 :o_music = 16'h1B1D;
			38 :o_music = 16'h1B6C;
			39 :o_music = 16'h1B5D;
			40 :o_music = 16'h175E;
			41 :o_music = 16'hD34;
			42 :o_music = 16'h33A;
			43 :o_music = 16'hFFFFFCF5;
			44 :o_music = 16'hFFFFFAC0;
			45 :o_music = 16'hFFFFF9B0;
			46 :o_music = 16'hFFFFF3FE;
			47 :o_music = 16'hFFFFF103;
			48 :o_music = 16'hFFFFF394;
			49 :o_music = 16'hFFFFEBEE;
			50 :o_music = 16'hFFFFDD00;
			51 :o_music = 16'hFFFFD7D4;
			52 :o_music = 16'hFFFFE07A;
			53 :o_music = 16'hFFFFEA88;
			54 :o_music = 16'hFFFFE8BA;
			55 :o_music = 16'hFFFFE507;
			56 :o_music = 16'hFFFFE4C4;
			57 :o_music = 16'hFFFFE68E;
			58 :o_music = 16'hFFFFEBB8;
			59 :o_music = 16'hFFFFED46;
			60 :o_music = 16'hFFFFF2B2;
			61 :o_music = 16'hFFFFF899;
			62 :o_music = 16'hFFFFF4AF;
			63 :o_music = 16'hFFFFFAA7;
		endcase
	end
	else begin
		case(i_ramp[5:0])
			0 :o_music = 16'h0;
			1 :o_music = 16'h0;
			2 :o_music = 16'h0;
			3 :o_music = 16'h0;
			4 :o_music = 16'h0;
			5 :o_music = 16'h0;
			6 :o_music = 16'h0;
			7 :o_music = 16'h366;
			8 :o_music = 16'h782;
			9 :o_music = 16'hC60;
			10 :o_music = 16'h1208;
			11 :o_music =16'h183A;
			12 :o_music = 16'h1E44;
			13 :o_music = 16'h23EB;
			14 :o_music = 16'h299B;
			15 :o_music = 16'h2EDE;
			16 :o_music = 16'h3339;
			17 :o_music = 16'h36B0;
			18 :o_music = 16'h38CC;
			19 :o_music = 16'h38FD;
			20 :o_music = 16'h3766;
			21 :o_music = 16'h34AA;
			22 :o_music = 16'h30FA;
			23 :o_music = 16'h2C38;
			24 :o_music = 16'h2697;
			25 :o_music = 16'h2056;
			26 :o_music = 16'h1984;
			27 :o_music = 16'h1224;
			28 :o_music = 16'hA8A;
			29 :o_music = 16'h385;
			30 :o_music = 16'hFFFFFDA8;
			31 :o_music = 16'hFFFFF8E0;
			32 :o_music = 16'hFFFFF4F2;
			33 :o_music = 16'hFFFFF192;
			34 :o_music = 16'hFFFFEE42;
			35 :o_music = 16'hFFFFEB00;
			36 :o_music = 16'hFFFFE84A;
			37 :o_music = 16'hFFFFE650;
			38 :o_music = 16'hFFFFE50C;
			39 :o_music = 16'hFFFFE496;
			40 :o_music = 16'hFFFFE48C;
			41 :o_music = 16'hFFFFE47C;
			42 :o_music = 16'hFFFFE465;
			43 :o_music = 16'hFFFFE412;
			44 :o_music = 16'hFFFFE361;
			45 :o_music = 16'hFFFFE2CC;
			46 :o_music = 16'hFFFFE2BC;
			47 :o_music = 16'hFFFFE31C;
			48 :o_music = 16'hFFFFE3E9;
			49 :o_music = 16'hFFFFE515;
			50 :o_music = 16'hFFFFE678;
			51 :o_music = 16'hFFFFE7D8;
			52 :o_music = 16'hFFFFE91B;
			53 :o_music = 16'hFFFFEA5E;
			54 :o_music = 16'hFFFFEBC1;
			55 :o_music = 16'hFFFFED67;
			56 :o_music = 16'hFFFFEF6D;
			57 :o_music = 16'hFFFFF1FA;
			58 :o_music = 16'hFFFFF4F2;
			59 :o_music = 16'hFFFFF7D9;
			60 :o_music = 16'hFFFFFA78;
			61 :o_music = 16'hFFFFFCD7;
			62 :o_music = 16'hFFFFFEF7;
			63 :o_music =16'hDA;
		endcase
	end
end
endmodule
