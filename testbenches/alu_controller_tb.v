module alu_controller_tb();

    reg [1:0] alu_op;
    reg [2:0] funct3;
    reg [6:0] funct7;

    wire [3:0] alu_control;

    alu_controller uut(
        .alu_op(alu_op),
        .funct3(funct3),
        .funct7(funct7),
        .alu_control(alu_control)
    );

    initial begin

        // =========================
        // R-TYPE INSTRUCTIONS
        // =========================

        // ADD
        alu_op = 2'b01;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #10;

        // SUB
        funct7 = 7'b0100000;
        #10;

        // SLL
        funct3 = 3'b001;
        funct7 = 7'b0000000;
        #10;

        // SLT
        funct3 = 3'b010;
        #10;

        // SLTU
        funct3 = 3'b011;
        #10;

        // XOR
        funct3 = 3'b100;
        #10;

        // SRL
        funct3 = 3'b101;
        funct7 = 7'b0000000;
        #10;

        // SRA
        funct7 = 7'b0100000;
        #10;

        // OR
        funct3 = 3'b110;
        funct7 = 7'b0000000;
        #10;

        // AND
        funct3 = 3'b111;
        #10;


        // =========================
        // I-TYPE INSTRUCTIONS
        // =========================

        alu_op = 2'b10;

        // ADDI
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #10;

        // SLLI
        funct3 = 3'b001;
        #10;

        // SLTI
        funct3 = 3'b010;
        #10;

        // SLTIU
        funct3 = 3'b011;
        #10;

        // XORI
        funct3 = 3'b100;
        #10;

        // SRLI
        funct3 = 3'b101;
        funct7 = 7'b0000000;
        #10;

        // SRAI
        funct7 = 7'b0100000;
        #10;

        // ORI
        funct3 = 3'b110;
        #10;

        // ANDI
        funct3 = 3'b111;
        #10;


        // =========================
        // BEQ
        // =========================

        alu_op = 2'b11;
        #10;


        // =========================
        // INVALID CASES
        // =========================

        // Invalid R-type funct3
        alu_op = 2'b01;
        funct3 = 3'b000; // valid funct3
        funct7 = 7'b1111111; // invalid funct7
        #10;

        // Invalid SRL/SRA funct7
        funct3 = 3'b101;
        funct7 = 7'b1111111;
        #10;

        // Invalid I-type funct3
        alu_op = 2'b10;
        funct3 = 3'b010; // valid example first
        #10;

        // Invalid alu_op
        alu_op = 2'bxx;
        #10;

        $finish;

    end

endmodule