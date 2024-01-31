module CLK_GEN(output reg CLK,
output reg CLK_BAR,
output reg CLR,
output reg CLR_BAR);
initial 
 begin
	CLK=1'b0;
	CLK_BAR=1'b1;
	CLR=1'b0;
	CLR_BAR=1'b1;
	repeat(10)@(posedge CLK);
	CLR=1'b1;
	CLR_BAR=1'b0;
	repeat(50)@(posedge CLK);
	
 end
always #5 CLK=~CLK;
always #5 CLK_BAR=~CLK_BAR;

endmodule
