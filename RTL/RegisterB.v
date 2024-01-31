module RegisterB #(parameter WIDTH=8)(input CLK,
input CLR,
input LB,
input [WIDTH-1:0] BUS_IN,
output reg [WIDTH-1:0] ALU_OUT
);
always @(posedge CLK)
 begin
	if(!CLR)
	 begin
		ALU_OUT<='b0;
	 end
	else if(!LB)
	 begin
		ALU_OUT<=BUS_IN;
	 end
 end




endmodule
