module program_counter#(parameter WIDTH=4)(input Cp,
input CLK,
input Ep,
input CLR,
output [WIDTH-1:0] FETCHED_ADDRESS);
reg [WIDTH-1:0] next_fetched_address;
always@(posedge CLK or negedge CLR)
 begin
	if(!CLR)
	 begin
		next_fetched_address<='b0;
	 end
	else if(Cp)
	 begin
		next_fetched_address<=next_fetched_address+1'b1;
	 end
 end

bufif1 U00 [3:0] (FETCHED_ADDRESS,next_fetched_address,Ep);
endmodule
