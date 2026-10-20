module instruction_memory(
    input [31:0] address,
    output [31:0] instruction
    );
    reg [31:0] memory [0:255]; // 256 instructions
    assign instruction = memory[address[9:2]]; // if you change memory size, change this as well
endmodule
