# SAP1-simple-as-possible-processor
![image](https://github.com/ayaahmed20018414/SAP1-simple-as-possible-processor/assets/82789012/decaecad-4322-451f-9d5b-15bc0e559440)


In this project, I designed Simple as possible processor which is a bus-organized computer and makes use of Von-Neumann architecture. It makes use of an 8-bit central bus and has ten main components. A pictorial representation of its architecture is shown above.

Program Counter: The program counter’s job is to store and send out the memory address of the next instruction to be fetched and executed. The program counter, which is part of the control unit, counts from 0000 to 1111 as the program is stored at the beginning of the memory with the first instruction at binary address 0000, the second instruction at address 0001, the third at address 0010, and so on.

Input and Memory Address Register (MAR): The MAR stores the 4-bit address of data or instruction which are placed in memory. When the SAP-1 is running, the 4-bit address is gotten from the Program Counter through the W-bus and then stored. This stored address is sent to the RAM where data or instructions are read from.

Random-Access Memory (RAM): The SAP-1 makes use of a 16 x 8 RAM (16 memory locations each storing 8 bits of data). The RAM can be programmed by means of the address and data switches allowing you to write to the memory before a computer run. During a computer run, the RAM receives its 4-bit address from the MAR and read operation is performed. In this way the instruction or data word stored in the RAM is placed on the W bus for use in some other part of the computer.

Instruction Register: The instruction receives and stores the instruction placed on the bus from the RAM. The content of the instruction register are then split into two nibbles. The upper nibble is a two-state output that goes into the Controller-sequencer while the lower nibble is a three-state output that is read from the bus when needed.

Controller-Sequencer: The controller-sequencer sends out signals that control the computer and makes sure things happen only when they are supposed to. The 12 bit output signals from controller-sequencer is called the control word which determines how the registers will react to the next positive clock edge. It has the following format: ` CON = Cp Ep ~Lm ~CE ~L1 ~E1 ~LA EU SU ~LB ~LO

Accumulator: The accumulator is an 8-bit buffer register that stores intermediate answers during a computer run. The accumulator has two outputs. The two-state output goes directly to the adder-subtractor and the three-state output goes to the bus. This implies that the 8-bit accumulator word continuously drives the adder- subtractor but only appears on the W bus when Ea is high.

Adder-Subtractor: The adder-subtractor asynchronously adds to or subtracts a value from the the accumulator depending on the value of Su. It makes use of 2’s complement to achieve this When Su is low the output of the adder-subtractor is the sum of the values in the accumulator and in the B-register (O/P = A + B). When Su is high, the output is the difference between them (O/P = A - B).

B-Register: The B-register is a buffer register used in performing arithmetic operations. It supplies the number to be added or subtracted from the contents of the accumulator to the adder/subtractor. When data is available at the bus and Lb is low, at the positive clock edge, B register gets and stores the data.

Output Register: The output register gets and stores the value stored in the accumulator usually after the performance of an arithmetic operation. The answer that is stored in the accumulator is loaded into the output register through the W bus. This is done in the next positive clock edge when Ea is high and Lo is low. The processed data can now be displayed to the outside world.




![image](https://github.com/ayaahmed20018414/SAP1-simple-as-possible-processor/assets/82789012/4d059146-253c-406a-af08-4bb96bc52295)
the figure above shows the instruction set of SAP-1 processor 



progam 1 output from ModelSim simulation tool
![Screenshot (1805)](https://github.com/ayaahmed20018414/SAP1-simple-as-possible-processor/assets/82789012/8c7cd3e6-cb47-4ab7-bf83-91609166b992)


progam 2 output from ModelSim simulation tool
![Screenshot (1808)](https://github.com/ayaahmed20018414/SAP1-simple-as-possible-processor/assets/82789012/6935fac4-89e9-46bf-aa44-df8d8dba2562)



