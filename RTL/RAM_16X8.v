module RAM_16X8#(parameter WIDTH=8,DEPTH=16)(input [WIDTH/2-1:0] Address,
input CE,
output [WIDTH-1:0] DATA_OUT);

reg [WIDTH-1:0] MEM [0:DEPTH-1];


assign DATA_OUT= (CE) ? ('bz):(MEM[Address]);


initial	$readmemb("program1.txt",MEM);



endmodule
