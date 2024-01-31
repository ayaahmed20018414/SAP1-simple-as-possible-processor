module INSTRUCTION_REGISTER#(parameter WIDTH1=4,WIDTH2=8)(input CLK,
input CLR,
input L1,
input E1,
input [WIDTH2-1:0] DATA_IN,
output reg [WIDTH1-1:0] BUS_OUT,
output reg [WIDTH1-1:0] seq_OUT);
reg [WIDTH1-1:0] BUS_OUT_reg;
always @(posedge CLK or negedge CLR)
 begin
	if(!CLR)
	 begin
		seq_OUT<='b0;
		BUS_OUT<='b0;
	 end
	else if(!L1)
	 begin
		seq_OUT<=DATA_IN[WIDTH2-1:WIDTH2/2];
		BUS_OUT<=DATA_IN[WIDTH2/2-1:0];
	 end
 end


endmodule
