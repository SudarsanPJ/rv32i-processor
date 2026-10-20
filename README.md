# RV32I Single-Cycle Processor

A modular 32-bit RISC-V processor core implemented in Verilog HDL, designed to explore processor architecture, datapath design, control logic, and instruction execution.

**Project Status:** Work in Progress

## Overview

This project involves the design and incremental integration of a synthesizable single-cycle RISC-V processor supporting a subset of the RV32I instruction set. The processor is developed using modular RTL components, with individual modules and integrated datapath functionality verified through Verilog testbenches.

The design follows a single-cycle architecture in which instruction fetch, decoding, execution, and write-back are intended to occur within one clock cycle.

## Main Integration

- [processor_test_partial2.v](rtl/processor_test_partial2.v) — Current integrated processor
- [processor_test_partial1.v](rtl/processor_test_partial1.v) — Earlier verified checkpoint

## Architecture and Modules

The processor is built from the following modules:

| Module | Description |
|---|---|
| Decoder | Extracts the opcode, register indices, and function fields from instructions |
| Control Unit | Generates control signals based on the instruction opcode |
| Register File | Provides two register read ports and one synchronous write port |
| ALU | Performs arithmetic, logical, shift, and comparison operations |
| ALU Controller | Determines the ALU operation using control signals and instruction function fields |
| Immediate Generator | Generates sign-extended and appropriately formatted I-, S-, B-, U-, and J-type immediates |
| ALU Source MUX | Selects the second ALU operand from register data or an immediate |
| Program Counter | Maintains the address of the current instruction |
| Instruction Memory | Stores and provides instructions based on the program counter |
| Branch Unit | Evaluates conditional branch instructions |
| Next-PC Logic | Selects the next instruction address for sequential execution, branches, and jumps |
| Write-Back MUX | Selects the value written back to the register file |

## Current Instruction Support

The following functionality has been implemented at the module level or integrated into the processor. Integration and verification are ongoing.

- **R-type:** Arithmetic and logical operations, including ADD, SUB, AND, OR, XOR, shifts, and comparisons.
- **I-type:** Immediate arithmetic and logical operations, including ADDI and related operations.
- **Conditional branching:** BEQ taken and not-taken paths have been verified in the integrated datapath.
- **Jump support:** Next-PC and write-back logic have been implemented for JAL and JALR; integrated verification remains ongoing.

Additional instruction support and memory operations are planned.

## Verification

Functional verification is performed using custom Verilog testbenches in AMD/Xilinx Vivado and XSim.

Verified functionality includes:

- ALU operations and instruction decoding.
- Register file read and write behavior.
- Immediate generation and instruction fetch.
- Integrated R-type and I-type execution.
- Conditional BEQ execution when the operands are equal and unequal.
- Program counter updates and branch target selection.

## Tools and Technologies

- Verilog HDL
- AMD/Xilinx Vivado
- XSim simulator
- Git and GitHub

## Repository Structure

```text
rv32i-processor/
├── rtl/
│   ├── alu.v
│   ├── alu_controller.v
│   ├── alu_src_mux.v
│   ├── branch_unit.v
│   ├── control_unit_v2.v
│   ├── decoder.v
│   ├── immediate_generator.v
│   ├── instruction_memory.v
│   ├── next_pc_logic.v
│   ├── program_counter.v
│   ├── register_file.v
│   └── wb_mux.v
├── testbenches/
│   └── processor_test_partial2_tb.v
└── README.md
```

*The filenames and folder structure above are illustrative; update them to match the actual files in the repository.*

## Future Work

- Verify all supported conditional branch instructions: BNE, BLT, BGE, BLTU, and BGEU.
- Complete and verify JAL and JALR integration.
- Extend datapath support for LUI and AUIPC.
- Implement data memory and integrate LW and SW.
- Expand instruction-level and integration test coverage.
- Validate the complete processor through longer instruction sequences.

## Learning Objectives

This project provides hands-on experience with:

- RISC-V instruction encoding and processor architecture.
- RTL design using Verilog HDL.
- Datapath and control-unit integration.
- Finite-width arithmetic and immediate generation.
- Simulation-based functional verification.
- Incremental hardware development and debugging.

## License

A license can be added if this project is intended for public reuse. Until then, all rights remain with the copyright holder.
