module SAP_TOP #(parameter WIDTH1=4,WIDTH2=8,DEPTH=16)(
output [WIDTH2-1:0] FINAL_RESULT );
wire CLK,CLK_BAR,CLR,CLR_BAR;
wire CP,EP,LM,CE,L1,E1,LA,EA,SU,EU,LB,LO;
wire [WIDTH1-1:0] seq_OUT,INSTR_ADDRESS,BUS_OUT;
wire [WIDTH2-1:0] REGB,BUS_OUTA,result,BUS;
//program count stage

program_counter#(.WIDTH(WIDTH1))U0(.Cp(CP),.CLK(CLK),.Ep(EP),.CLR(CLR),.FETCHED_ADDRESS(BUS[WIDTH1-1:0]));

input_and_MAR #(.WIDTH(WIDTH1))U1(.CLK(CLK),.LM(LM),.ADDRESS(BUS[WIDTH1-1:0]),.ADDRESS_OUT(INSTR_ADDRESS));

RAM_16X8#(.WIDTH(WIDTH2),.DEPTH(DEPTH))U2(.Address(INSTR_ADDRESS),.CE(CE),.DATA_OUT(BUS));

INSTRUCTION_REGISTER#(.WIDTH1(WIDTH1),.WIDTH2(WIDTH2))U3(.CLK(CLK),.CLR(CLR),.L1(L1),
.E1(E1),.DATA_IN(BUS),.BUS_OUT(BUS_OUT),.seq_OUT(seq_OUT));

bufif1 U000 [3:0] (BUS[3:0],BUS_OUT,~E1);

CLK_GEN U4(.CLK(CLK),.CLK_BAR(CLK_BAR),.CLR(CLR),.CLR_BAR(CLR_BAR));

controller_sequencer#(.WIDTH(WIDTH1))U5(.opcode(seq_OUT),.CLK(CLK),
.CLR(CLR),.Cp(CP),.Ep(EP),.LM(LM),
.CE(CE),.L1(L1),.E1(E1),.LA(LA),.EA(EA),.SU(SU),
.EU(EU),.LB(LB),.LO(LO));

AccumlatorA #(.WIDTH(WIDTH2))U6(.CLK(CLK),.LA(LA),
.EA(EA),.BUS_IN(BUS),.BUS_OUT(BUS_OUTA));

bufif1 U001 [7:0] (BUS,BUS_OUTA,EA);

Adder_subtractor#(.WIDTH(WIDTH2))U7(.SU(SU),
.EU(EU),.REGA(BUS_OUTA),.REGB(REGB),.result(result));

bufif1 U011 [7:0] (BUS,result,EU);

RegisterB #(.WIDTH(WIDTH2))U8(.CLK(CLK),.CLR(CLR),
.LB(LB),.BUS_IN(BUS),.ALU_OUT(REGB));

output_register #(.WIDTH(WIDTH2))U9(.CLK(CLK),
.LO(LO),.BUS_IN(BUS),.result(FINAL_RESULT));



endmodule
