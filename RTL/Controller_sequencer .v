module controller_sequencer#(parameter WIDTH=4)(input [WIDTH-1:0] opcode,
input CLK,
input CLR,
output reg Cp,
output reg Ep,
output reg LM,
output reg CE,
output reg L1,
output reg E1,
output reg LA,
output reg EA,
output reg SU,
output reg EU,
output reg LB,
output reg LO);
localparam ADDRESS_STATE=3'b000,
INCREMENT_STATE=3'b001,
MEMORY_STATE=3'b011,
fetch_cycle1=3'b010,
fetch_cycle2=3'b110,
fetch_cycle3=3'b111;
reg [2:0] next_state,current_state;
always @(negedge CLK or negedge CLR)
 begin
  	if(!CLR)
	 begin
		current_state<='b0;
	 end
	else
	 begin
		current_state<=next_state;
	 end
 end
always @(*)
 begin
	case(current_state)
	 ADDRESS_STATE:begin
			next_state=INCREMENT_STATE;
		       end
	 INCREMENT_STATE:begin
			next_state=MEMORY_STATE;
		       end
	 MEMORY_STATE:begin
			next_state=fetch_cycle1;
		       end
	 fetch_cycle1:begin
			next_state=fetch_cycle2;
		       end
	 fetch_cycle2:begin
			next_state=fetch_cycle3;
		       end
	 fetch_cycle3:begin
			next_state=ADDRESS_STATE;
		       end
	 endcase
 end
always @(*)
 begin
	case(current_state)
	 ADDRESS_STATE:begin
			 Cp=1'b0;
			 Ep=1'b1;
			 LM=1'b0;
			 CE=1'b1;
			 L1=1'b1;
			 E1=1'b1;
			 LA=1'b1;
			 EA=1'b0;
			 SU=1'b0;
			 EU=1'b0;
			 LB=1'b1;
			 LO=1'b1;
		       end
	 INCREMENT_STATE:begin
			 Cp=1'b1;
			 Ep=1'b0;
			 LM=1'b1;
			 CE=1'b1;
			 L1=1'b1;
			 E1=1'b1;
			 LA=1'b1;
			 EA=1'b0;
			 SU=1'b0;
			 EU=1'b0;
			 LB=1'b1;
			 LO=1'b1;			
		       end
	 MEMORY_STATE:begin
			 Cp=1'b0;
			 Ep=1'b0;
			 LM=1'b1;
			 CE=1'b0;
			 L1=1'b0;
			 E1=1'b1;
			 LA=1'b1;
			 EA=1'b0;
			 SU=1'b0;
			 EU=1'b0;
			 LB=1'b1;
			 LO=1'b1;
		       end
	 fetch_cycle1:begin
			case(opcode)
			 'b0000:begin  //load instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b0;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b0;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;						
				end
			 'b0001:begin  //add instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b0;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b0;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;					
				end
			 'b0010:begin  //SUB instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b0;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b0;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;					
				end
			 'b1110:begin  // OUT instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b1;
				 EA=1'b1;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b0;					
				end
			 'b1111:begin  // HLT instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;
				end
			endcase
		       end
	 fetch_cycle2:begin
		       case(opcode)
			 'b0000:begin  //load instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b0;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b0;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;						
				end
			 'b0001:begin  //add instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b0;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b0;
				 LO=1'b1;					
				end
			 'b0010:begin  //SUB instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b0;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b0;
				 LO=1'b1;						
				end
			 'b1110:begin  // OUT instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;					
				end
			 'b1111:begin  // HLT instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;				 					
				end
			endcase
		       end
	 fetch_cycle3:begin
		       case(opcode)
			 'b0000:begin  //load instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;						
				end
			 'b0001:begin  //add instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b0;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b1;
				 LB=1'b1;
				 LO=1'b1;					
				end
			 'b0010:begin  //SUB instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b0;
				 EA=1'b0;
				 SU=1'b1;
				 EU=1'b1;
				 LB=1'b1;
				 LO=1'b1;						
				end
			 'b1110:begin  // OUT instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;					
				end
			 'b1111:begin  // HLT instruction
				 Cp=1'b0;
				 Ep=1'b0;
				 LM=1'b1;
				 CE=1'b1;
				 L1=1'b1;
				 E1=1'b1;
				 LA=1'b1;
				 EA=1'b0;
				 SU=1'b0;
				 EU=1'b0;
				 LB=1'b1;
				 LO=1'b1;				 					
				end
			endcase			
		       end
		endcase
 end
endmodule 
