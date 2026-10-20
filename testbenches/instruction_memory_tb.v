module instruction_memory_tb();
    reg [31:0] address;
    wire [31:0] instruction;
    
    instruction_memory uut(.address(address),.instruction(instruction));
    
    initial begin
    uut.memory[0] = 32'h00A00193; // ADDI x3, x0, 10
    uut.memory[1] = 32'h00700213; // ADDI x4, x0, 7
    uut.memory[2] = 32'h003202B3; // ADD x5, x4, x3
    uut.memory[3] = 32'h401182B3; // SUB x5, x3, x1
    uut.memory[4] = 32'h003172B3; // AND x5, x2, x3
    
    address = 0; #10;
    address = 4; #10;
    address = 8; #10;
    address = 12; #10;
    address = 16; #10;
    $finish;
    
    end
endmodule
