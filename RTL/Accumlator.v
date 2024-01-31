module AccumlatorA #(parameter WIDTH=8)(input CLK,
input LA,
input EA,
input [WIDTH-1:0] BUS_IN,
output reg [WIDTH-1:0] BUS_OUT
);

always @(posedge CLK)
 begin
	if(!LA)
	 begin
		BUS_OUT<=BUS_IN;
	 end
 end




endmodule
