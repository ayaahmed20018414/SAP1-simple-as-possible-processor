module input_and_MAR #(parameter WIDTH=4)(input CLK,
input CLR,
input LM,
input [WIDTH-1:0] ADDRESS,
output reg [WIDTH-1:0] ADDRESS_OUT
);
always @(posedge CLK or negedge CLR)
 begin
	if(!CLR)
	 begin
		ADDRESS_OUT<='b0;
	 end
	else if(!LM)
	 begin
		ADDRESS_OUT<=ADDRESS;
	 end
 end 


endmodule
