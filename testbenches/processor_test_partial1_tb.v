module processor_test_partial1_tb();
    
    reg [31:0] instruction;
    reg clk;
    wire [31:0]alu_output;
    
    processor_test_partial1 uut(.instruction(instruction), .clk(clk),.alu_output(alu_output));
    
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        instruction = 32'h00A00193; #10; //addi x3,x0,10 (x3 = 10)
        $display("ALU output = %d", alu_output);
        instruction = 32'h00700213; #10; // ADDI x4, x0, 7 (x4 = 7)
        $display("ALU output = %d", alu_output);
        instruction = 32'h003202B3; #10; // ADD x5, x4, x3 (x5 = x4 + x3)
        $display("read_data1 = %d, read_data2 = %d", uut.read_data1, uut.read_data2);
        $display("ALU output = %d", alu_output);
        
        $display("x3 = %d, x4 = %d, x5 = %d", uut.uut4.registers[3], uut.uut4.registers[4],
        uut.uut4.registers[5]);
        $finish;
    end
endmodule
