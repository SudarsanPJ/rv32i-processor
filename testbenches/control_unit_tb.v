module control_unit_tb();

    reg [6:0] opcode;

    wire [1:0] alu_op;
    wire [1:0] alu_src;
    wire       reg_write;
    wire       mem_read;
    wire       mem_write;
    wire [1:0] wb_sel;
    wire       branch;
    wire       jump;
    wire [2:0] imm_type;

    control_unit uut(
        .opcode(opcode),
        .alu_op(alu_op),
        .alu_src(alu_src),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .wb_sel(wb_sel),
        .branch(branch),
        .jump(jump),
        .imm_type(imm_type)
    );
    initial begin
    opcode = 7'h33;#10;
    opcode = 7'h13;#10;
    opcode = 7'h03;#10;
    opcode = 7'h23;#10;
    opcode = 7'h63;#10;
    opcode = 7'h37;#10;
    opcode = 7'h17;#10;
    opcode = 7'h6F;#10; 
    opcode = 7'h67;#10;
    $finish;
    end
    

endmodule