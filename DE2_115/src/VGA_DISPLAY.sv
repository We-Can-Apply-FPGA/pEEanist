module VGA_DISPLAY(
	input [10:0] X,
	input [10:0] Y,
	input CLK_to_DAC,
	input RST_N,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B,
	input [24:0] Ctrl
);

reg [7:0] vga_r;
reg [7:0] vga_g;
reg [7:0] vga_b;

parameter blk = 10;

logic [23:0] counter_r, counter_w;

logic [24:0][49:0][23:0] display_r ;
logic [24:0][49:0][23:0] display_w ;

assign VGA_R = vga_r;
assign VGA_G = vga_g;
assign VGA_B = vga_b;

// Pattern Generator

always begin
	counter_w = counter_r + 1;
	display_w[24:1] = display_r[23:0];
	display_w[0] = '0;
	////////1111
	if (Ctrl[0]) begin
		display_w[0][0] = 24'hFBB735;
		display_w[0][1] = 24'hFBB735;
		display_w[0][2] = 24'hFBB735;
	end
	if (Ctrl[2]) begin
		display_w[0][3] = 24'hE98931;
		display_w[0][4] = 24'hE98931;
		display_w[0][5] = 24'hE98931;
	end
	if (Ctrl[1]) begin
		display_w[0][2] = 24'hf2a033;
		display_w[0][3] = 24'hf2a033;
	end
	////////2222
	if (Ctrl[3]) begin
		display_w[0][6] = 24'hea64b6;
		display_w[0][7] = 24'hea64b6;
		display_w[0][8] = 24'hea64b6;
	end
	if (Ctrl[5]) begin
		display_w[0][9] = 24'hcf3739;
		display_w[0][10] = 24'hcf3739;
		display_w[0][11] = 24'hcf3739;
	end
	if (Ctrl[7]) begin
		display_w[0][12] = 24'h8fac51;
		display_w[0][13] = 24'h8fac51;
		display_w[0][14] = 24'h8fac51;
	end
	if (Ctrl[4]) begin
		display_w[0][8] = 24'hEB403B;
		display_w[0][9] = 24'hEB403B;
	end
	if (Ctrl[6]) begin
		display_w[0][11] = 24'hB32E37;
		display_w[0][12] = 24'hB32E37;
	end
	////////3333
	if (Ctrl[8]) begin
		display_w[0][15] = 24'h6C2A6A;
		display_w[0][16] = 24'h6C2A6A;
		display_w[0][17] = 24'h6C2A6A;
	end
	if (Ctrl[10]) begin
		display_w[0][18] = 24'h5C4399;
		display_w[0][19] = 24'h5C4399;
		display_w[0][20] = 24'h5C4399;
	end
	if (Ctrl[12]) begin
		display_w[0][21] = 24'h274389;
		display_w[0][22] = 24'h274389;
		display_w[0][23] = 24'h274389;
	end
	if (Ctrl[14]) begin
		display_w[0][24] = 24'h1F5EA8;
		display_w[0][25] = 24'h1F5EA8;
		display_w[0][26] = 24'h1F5EA8;
	end
	if (Ctrl[9]) begin
		display_w[0][17] = 24'h643701;
		display_w[0][18] = 24'h643701;
	end
	if (Ctrl[11]) begin
		display_w[0][20] = 24'h41c391;
		display_w[0][21] = 24'h41c391;
	end
	if (Ctrl[13]) begin
		display_w[0][23] = 24'h235118;
		display_w[0][24] = 24'h235118;
	end
	////////4444
	if (Ctrl[15]) begin
		display_w[0][27] = 24'h20ef2c;
		display_w[0][28] = 24'h20ef2c;
		display_w[0][29] = 24'h20ef2c;
	end
	if (Ctrl[17]) begin
		display_w[0][30] = 24'h26983a;
		display_w[0][31] = 24'h26983a;
		display_w[0][32] = 24'h26983a;
	end
	if (Ctrl[19]) begin
		display_w[0][33] = 24'h3238bc;
		display_w[0][34] = 24'h3238bc;
		display_w[0][35] = 24'h3238bc;
	end
	if (Ctrl[16]) begin
		display_w[0][29] = 24'h227FB0;
		display_w[0][30] = 24'h227FB0;
	end
	if (Ctrl[18]) begin
		display_w[0][32] = 24'h39C0B3;
		display_w[0][33] = 24'h39C0B3;
	end
	////////5555
	if (Ctrl[20]) begin
		display_w[0][36] = 24'h02C874;
		display_w[0][37] = 24'h02C874;
		display_w[0][38] = 24'h02C874;
	end
	if (Ctrl[22]) begin
		display_w[0][39] = 24'h009100;
		display_w[0][40] = 24'h009100;
		display_w[0][41] = 24'h009100;
	end
	if (Ctrl[24]) begin
		display_w[0][42] = 24'h737300;
		display_w[0][43] = 24'h737300;
		display_w[0][44] = 24'h737300;
	end
	if (Ctrl[21]) begin
		display_w[0][38] = 24'h1e4493;
		display_w[0][39] = 24'h1e4493;
	end
	if (Ctrl[23]) begin
		display_w[0][41] = 24'h02c874;
		display_w[0][42] = 24'h02c874;
	end
	//////
end

always@(posedge CLK_to_DAC or negedge RST_N) begin
	if (!RST_N) begin
		vga_r <= 0;
		vga_g <= 0;
		vga_b <= 0;
	end
	else begin
		if (X <= 150 && Y <= 450) begin			 //white
			vga_r <= 255;
			vga_g <= 255;
			vga_b <= 255;
			if (Y <= 30 && Ctrl[0]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 60 && Y > 30 && Ctrl[2]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 90 && Y > 60 && Ctrl[3]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 120 && Y > 90 && Ctrl[5]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 150 && Y > 120 && Ctrl[7]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 180 && Y > 150 && Ctrl[8]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 210 && Y > 180 && Ctrl[10]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 240 && Y > 210 && Ctrl[12]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 270 && Y > 240 && Ctrl[14]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 300 && Y > 270 && Ctrl[15]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 330 && Y > 300 && Ctrl[17]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 360 && Y > 330 && Ctrl[19]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 390 && Y > 360 && Ctrl[20]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 420 && Y > 390 && Ctrl[22]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			else if (Y <= 450 && Y > 420 && Ctrl[24]) begin
				vga_r <= 0;
				vga_g <= 128;
				vga_b <= 255;
			end
			
			if (X > 30) begin                    //black 
				if (Y > 20 && Y <= 40) begin
					if (!Ctrl[1]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
				else if (Y > 58 && Y <= 62) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 80 && Y <= 100) begin
					if (!Ctrl[4]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
				else if (Y > 110 && Y <= 130) begin
					if (!Ctrl[6]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
				else if (Y > 148 && Y <= 152) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 170 && Y <= 190) begin
					if (!Ctrl[9]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
				else if (Y > 200 && Y <= 220) begin
					if (!Ctrl[11]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
				else if (Y > 230 && Y <= 250) begin
					if (!Ctrl[13]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
				else if (Y > 268 && Y <= 272) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 290 && Y <= 310) begin
					if (!Ctrl[16]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
				else if (Y > 320 && Y <= 340) begin
					if (!Ctrl[18]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
				else if (Y > 358 && Y <= 362) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 380 && Y <= 400) begin
					if (!Ctrl[21]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
				else if (Y > 410 && Y <= 430) begin
					if (!Ctrl[23]) begin
						vga_r <= 0;
						vga_g <= 0;
						vga_b <= 0;
					end
					else begin
						vga_r <= 255;
						vga_g <= 128;
						vga_b <= 0;
					end
				end
			end
			else if (X <= 30) begin              //black line
				if (Y > 28 && Y <= 32) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 58 && Y <= 62) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 88 && Y <= 92) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 118 && Y <= 122) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 148 && Y <= 152) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 178 && Y <= 182) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 208 && Y <= 212) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 238 && Y <= 242) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 268 && Y <= 272) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 298 && Y <= 302) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 328 && Y <= 332) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 358 && Y <= 362) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 388 && Y <= 392) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
				else if (Y > 418 && Y <= 422) begin
					vga_r <= 0;
					vga_g <= 0;
					vga_b <= 0;
				end
			end
		end
		else if (X > 150 && Y <= 450) begin     //eject wave
			if (Y > 0)
				{vga_r, vga_g, vga_b} <= display_r[(X-151)/26][(Y-1)/10];
			else 
				{vga_r, vga_g, vga_b} <= display_r[(X-151)/26][0];
		end
		else if (Y > 450) begin 		          
			//Output p
			if (((X > 3 * blk && X <= 5 * blk) || (X > 6 * blk && X <= 8 * blk)) && Y > 450 + 4 * blk && Y <= 450 + 5 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;	
			end
			else if (X > 4 * blk && X <= 5 * blk && Y > 450 + 5 * blk && Y <= 450 + 14 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 5 * blk && X <= 6 * blk && ((Y > 450 + 5 * blk && Y <= 450 + 6 * blk)||(Y > 450 + 8 * blk && Y <= 450 + 9 * blk))) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 6 * blk && X <= 8 * blk && Y > 450 + 9 * blk && Y <= 450 + 10 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 8 * blk && X <= 9 * blk && Y > 450 + 5 * blk && Y <= 450 + 9 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			//
			//Output E
			else if (X > 11 * blk && X <= 17 * blk && Y > 450 + 2 * blk && Y <= 450 + 3 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 12 * blk && X <= 13 * blk && Y > 450 + 3 * blk && Y <= 450 + 12 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 11 * blk && X <= 17 * blk && Y > 450 + 12 * blk && Y <= 450 + 13 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 12 * blk && X <= 14 * blk && Y > 450 + 7 * blk && Y <= 450 + 8 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 16 * blk && X <= 17 * blk && Y > 450 + 2 * blk && Y <= 450 + 5 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 16 * blk && X <= 17 * blk && Y > 450 + 10 * blk && Y <= 450 + 13 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 14 * blk && X <= 15 * blk && Y > 450 + 6 * blk && Y <= 450 + 9 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			//
			//Output E
			else if (X > 19 * blk && X <= 25 * blk && Y > 450 + 2 * blk && Y <= 450 + 3 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 20 * blk && X <= 21 * blk && Y > 450 + 3 * blk && Y <= 450 + 12 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 19 * blk && X <= 25 * blk && Y > 450 + 12 * blk && Y <= 450 + 13 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 20 * blk && X <= 22 * blk && Y > 450 + 7 * blk && Y <= 450 + 8 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 24 * blk && X <= 25 * blk && Y > 450 + 2 * blk && Y <= 450 + 5 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 24 * blk && X <= 25 * blk && Y > 450 + 10 * blk && Y <= 450 + 13 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 22 * blk && X <= 23 * blk && Y > 450 + 6 * blk && Y <= 450 + 9 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			//
			//Output a
			else if (X > 27 * blk && X <= 28 * blk && ((Y > 450 + 5 * blk && Y <= 450 + 6 * blk) || (Y > 450 + 8 * blk && Y <= 450 + 11 * blk))) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 28 * blk && X <= 31 * blk && Y > 450 + 4 * blk && Y <= 450 + 5 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 28 * blk && X <= 30 * blk && Y > 450 + 7 * blk && Y <= 450 + 8 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (((X > 28 * blk && X <= 31 * blk) || (X > 32 * blk && X <= 33 * blk)) && Y > 450 + 11 * blk && Y <= 450 + 12 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 31 * blk && X <= 32 * blk && Y > 450 + 5 * blk && Y <= 450 + 11 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 30 * blk && X <= 31 * blk && Y > 450 + 8 * blk && Y <= 450 + 9 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			//
			//Output n
			else if (((X > 34 * blk && X <= 36 * blk) || (X > 37 * blk && X <= 39 * blk)) && Y > 450 + 4 * blk && Y <= 450 + 5 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 35 * blk && X <= 36 * blk && Y > 450 + 5 * blk && Y <= 450 + 12 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 39 * blk && X <= 40 * blk && Y > 450 + 5 * blk && Y <= 450 + 12 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 36 * blk && X <= 37 * blk && Y > 450 + 5 * blk && Y <= 450 + 7 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			//
			//Output i
			else if (X > 42 * blk && X <= 44 * blk && Y > 450 + 4 * blk && Y <= 450 + 5 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 44 * blk && X <= 45 * blk && ((Y > 450 + 1 * blk && Y <= 450 + 3 * blk) || (Y > 450 + 4 * blk && Y <= 450 + 12 * blk))) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			//
			//Output s
			else if (X > 48 * blk && X <= 51 * blk && ((Y > 450 + 4 * blk && Y <= 450 + 5 * blk) || (Y > 450 + 11 * blk && Y <= 450 + 12 * blk))) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 48 * blk && X <= 50 * blk && Y > 450 + 7 * blk && Y <= 450 + 8 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 50 * blk && X <= 51 * blk && Y > 450 + 8 * blk && Y <= 450 + 9 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 47 * blk && X <= 48 * blk && ((Y > 450 + 5 * blk && Y <= 450 + 7 * blk) || (Y > 450 + 10 * blk && Y <= 450 + 11 * blk))) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 51 * blk && X <= 52 * blk && ((Y > 450 + 5 * blk && Y <= 450 + 6 * blk) || (Y > 450 + 9 * blk && Y <= 450 + 11 * blk))) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			//
			//Output t
			else if (X > 54 * blk && X <= 59 * blk && Y > 450 + 5 * blk && Y <= 450 + 6 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 56 * blk && X <= 57 * blk && Y > 450 + 1 * blk && Y <= 450 + 11 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 57 * blk && X <= 58 * blk && Y > 450 + 11 * blk && Y <= 450 + 12 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			else if (X > 58 * blk && X <= 59 * blk && Y > 450 + 10 * blk && Y <= 450 + 11 * blk) begin
				vga_r <= 16'hFF;
				vga_g <= 16'h35;
				vga_b <= 16'h9A;
			end
			//
			else begin
				vga_r <= 0;
				vga_g <= 0;
				vga_b <= 0;
			end
		end
		else begin
			vga_r <= 0;
			vga_g <= 0;
			vga_b <= 0;
		end
	end
end

always@(posedge CLK_to_DAC or negedge RST_N) begin
	if(!RST_N)
		counter_r <= 0;
	else
		counter_r <= counter_w;
end

always@(posedge counter_r[22]) begin
	display_r <= display_w;
end
endmodule