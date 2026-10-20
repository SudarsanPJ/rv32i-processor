module decoder_tb(
    );

    reg [31:0] instruction;

    wire [6:0] opcode;
    wire [4:0] rd;
    wire [2:0] funct3;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [6:0] funct7;

    decoder uut(
        .instruction(instruction),
        .opcode(opcode),
        .rd(rd),
        .funct3(funct3),
        .rs1(rs1),
        .rs2(rs2),
        .funct7(funct7)
    );

    initial begin
    instruction = 32'h007302B3;#10;
    instruction = 32'h40A48433;#10;
    instruction = 32'h00D675B3;#10;
    instruction = 32'h00A30293;#10;
    instruction = 32'h00832283;#10;
    instruction = 32'h00732423;#10;
    instruction = 32'h00628463;#10;
    $finish;
    end

endmodule