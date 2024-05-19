# SingleCycleProcessor-Nexys3-FPGA
This single cycle processor is designed with a Harvard architecture, meaning it has separate memory spaces for instructions and data, enabling simultaneous access and increasing throughput. The processor architecture is similar to the MIPS instruction set and supports three major categories of instructions: R-Type, I-Type, and J-Type.
Instruction Set Architecture (ISA): The processor supports a subset of MIPS instructions, categorized into:
- R-Type Instructions: These include arithmetic and logical operations performed on registers. Examples include add, sub, mul.
- I-Type Instructions: These include immediate operations, load/store operations, and branch operations. Examples include addi, lw, sw, beq, addi, subi, muli.
- J-Type Instructions: These include jump instructions for altering the program control flow. Examples include j.
Single Cycle Operation: Each instruction is executed in a single clock cycle, simplifying control logic and making it suitable for educational purposes and initial design explorations.
FPGA Implementation:
- Nexys 3 FPGA Board: The processor is designed to be synthesized and deployed on the Nexys 3 FPGA board.
- Time-Multiplexed Seven-Segment Display: A custom time-multiplexing unit is integrated to drive the seven-segment display on the Nexys 3 board, allowing efficient display of processor status, output, or debugging information.
