# SingleCycleProcessor-Nexys3-FPGA
This single cycle processor is designed with a Harvard architecture, meaning it has separate memory spaces for instructions and data, enabling simultaneous access and increasing throughput. The processor architecture is similar to the MIPS instruction set and supports three major categories of instructions: R-Type, I-Type, and J-Type.
Instruction Set Architecture (ISA): The processor supports a subset of MIPS instructions, categorized into:
- R-Type Instructions: These include arithmetic and logical operations performed on registers. Examples include add, sub, mul.
- I-Type Instructions: These include immediate operations, load/store operations, and branch operations. Examples include addi, lw, sw, beq, addi, subi, muli.
- J-Type Instructions: These include jump instructions for altering the program control flow. Examples include j.
