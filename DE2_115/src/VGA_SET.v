module VGA_SET(
	input CLK_to_DAC,
	output [7:0] VGA_R,
	output [7:0] VGA_G,
	output [7:0] VGA_B,
	output VGA_HS,
	output VGA_VS,
	output VGA_BLANK_N,
	output VGA_SYNC_N,
	input RST_N,
	input [24:0] Ctrl
);

// Horizontal Parameter
parameter H_FRONT = 40;
parameter H_SYNC  = 128;
parameter H_BACK  = 88;
parameter H_ACT   = 800;
parameter H_BLANK = H_FRONT + H_SYNC + H_BACK;
parameter H_TOTAL = H_FRONT + H_SYNC + H_BACK + H_ACT;

// Vertical Parameter
parameter V_FRONT = 1;
parameter V_SYNC  = 4;
parameter V_BACK  = 23;
parameter V_ACT   = 600;
parameter V_BLANK = V_FRONT + V_SYNC + V_BACK;
parameter V_TOTAL = V_FRONT + V_SYNC + V_BACK + V_ACT;

assign VGA_SYNC_N  = 1'b0;        	// This pin is unused.
assign VGA_BLANK_N = ~((H_Cont<H_BLANK)||(V_Cont<V_BLANK));

reg [10:0] H_Cont;
reg [10:0] V_Cont;
reg        vga_hs;
reg        vga_vs;
reg [10:0] X;
reg [10:0] Y;

assign VGA_HS = vga_hs;
assign VGA_VS = vga_vs;

VGA_DISPLAY dis(
	.X(X),
	.Y(Y),
	.CLK_to_DAC(CLK_to_DAC),
	.RST_N(RST_N),
	.VGA_R(VGA_R),
	.VGA_G(VGA_G),
	.VGA_B(VGA_B),
	.Ctrl(Ctrl)
);

// Horizontal Generator: Refer to the pixel clock
always@(posedge CLK_to_DAC, negedge RST_N) begin
  if(!RST_N) begin
    H_Cont <= 0;
    vga_hs <= 1;
    X      <= 0;
  end 
  else begin
    if (H_Cont < H_TOTAL)
      H_Cont	<=	H_Cont+1'b1;
    else
      H_Cont	<=	0;
      
    // Horizontal Sync
    if(H_Cont == H_FRONT-1) // Front porch end
      vga_hs <= 1'b0;
      
    if(H_Cont == H_FRONT + H_SYNC -1) // Sync pulse end
      vga_hs <= 1'b1;

    // Current X
    if(H_Cont >= H_BLANK)
      X <= H_Cont-H_BLANK;
    else
      X <= 0;
  end
end

// Vertical Generator: Refer to the horizontal sync
always@(posedge VGA_HS, negedge RST_N) begin
  if(!RST_N) begin
    V_Cont <= 0;
    vga_vs <= 1;
    Y      <= 0;
  end
  else begin
    if (V_Cont<V_TOTAL)
      V_Cont <= V_Cont + 1'b1;
    else
      V_Cont	<= 0;
      
    // Vertical Sync
    if (V_Cont == V_FRONT-1) // Front porch end
      vga_vs <= 1'b0;
      
    if (V_Cont == V_FRONT + V_SYNC-1) // Sync pulse end
      vga_vs <= 1'b1;
      
    // Current Y
    if (V_Cont >= V_BLANK)
      Y <= V_Cont-V_BLANK;
    else
      Y <= 0;
  end
end

endmodule
