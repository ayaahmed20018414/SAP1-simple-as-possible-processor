module Adder_subtractor#(parameter WIDTH=8)(input SU,
input EU,
input [WIDTH-1:0] REGA,
input [WIDTH-1:0] REGB,
output reg [WIDTH-1:0] result);
reg [WIDTH-1:0] REG_RESULT;
always@(*)
 begin
	if(!SU)
	 begin
		REG_RESULT<=REGA+REGB;
	 end
	else
	 begin
		REG_RESULT<=REGA-REGB;
	 end
 end

always@(*)
 begin
	if(EU)
	 begin
		result<=REG_RESULT;
	 end
	else
	 begin
		result<='b0;
	 end
 end

endmodule
