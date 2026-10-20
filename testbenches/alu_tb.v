module alu_tb(

    );
    reg [31:0] operand_a,operand_b;
    reg [3:0] alu_control;
    wire [31:0] result;
    alu uut(.operand_a(operand_a),
    .operand_b(operand_b),
    .alu_control(alu_control),
    .result(result)
    );
    integer i;
    initial begin
    operand_a = 32'd10;
    operand_b = 32'd5;
    for(i = 0; i < 11; i = i + 1)begin
        alu_control = i;#10;
    end
        // Test SLT and SLTU
    operand_a = 32'd5;
    operand_b = 32'd10;

    alu_control = 4'b1000; // SLT
    #10;

    alu_control = 4'b1001; // SLTU
    #10;

    // Test signed vs unsigned
    operand_a = 32'hFFFFFFFF; // -1 signed, 4294967295 unsigned
    operand_b = 32'd1;

    alu_control = 4'b1000; // SLT
    #10;

    alu_control = 4'b1001; // SLTU
    #10;

    $finish;
    end
endmodule
