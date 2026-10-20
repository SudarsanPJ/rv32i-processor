module processor_test_partial2_tb();

reg clk;
reg rst;

processor_test_partial2 uut(
    .clk(clk),
    .rst(rst)
);

always #5 clk = ~clk;

initial begin

    // Initialize clock and reset
    clk = 0;
    rst = 1;

    // Hold reset for one clock cycle
    #10;
    rst = 0;

    // Program
    // ADDI x3, x0, 10
    // ADDI x4, x0, 10
    // BEQ  x3, x4, equal
    // ADDI x7, x0, 0
    // JAL  x0, done
    // equal:
    // ADDI x7, x0, 1
    // done:

    uut.uut11.memory[0] = 32'h00A00193;
    uut.uut11.memory[1] = 32'h00A00213;
    uut.uut11.memory[2] = 32'h00418663;
    uut.uut11.memory[3] = 32'h00000393;
    uut.uut11.memory[4] = 32'h0080006F;
    uut.uut11.memory[5] = 32'h00100393;

    // Wait for the program to execute
    #50;

    // Display results
    $display("x3 = %d", uut.uut4.registers[3]);
    $display("x4 = %d", uut.uut4.registers[4]);
    $display("x7 = %d", uut.uut4.registers[7]);

    $display("PC = %d", uut.pc);

    $finish;
end

endmodule