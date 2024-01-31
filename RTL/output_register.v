module output_register #(parameter WIDTH=8)(input CLK,
input LO,
input [WIDTH-1:0] BUS_IN,
output reg [WIDTH-1:0] result
);

always @(posedge CLK)
 begin
	if(!LO)
	 begin
		result<=BUS_IN;
	 end
	else
	 begin
		result<=result;
	 end
 end




endmodule
