//integrating the necessary modules for testing R and I operations. 
// Contains control Unit, immediate generator, decoder, register file, alu controller
// alu src mux and alu.
module processor_test_partial1(
    input [31:0] instruction,
    input clk,
    output [31:0] alu_output
    );
    //decoder wires
    wire [6:0] opcode;
    wire [4:0] rd;
    wire [2:0] funct3;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [6:0] funct7;
    
    decoder uut1(.instruction(instruction),.opcode(opcode),.rd(rd),
    .funct3(funct3),.rs1(rs1),.rs2(rs2),.funct7(funct7));
    
    //control unit wires
    wire [1:0] alu_op;
    wire [1:0] alu_src;
    wire reg_write;
    wire [2:0] imm_type;
    
    //only connected the outputs necessary for R and I testing
    control_unit uut2(.opcode(opcode),.alu_op(alu_op),.alu_src(alu_src),
    .reg_write(reg_write), .imm_type(imm_type));
    
    //Imediate generator wire
    wire [31:0] immediate; 
    //imm_type
    
    immediate_generator uut3(.instruction(instruction),.immediate(immediate),
    .imm_type(imm_type));
    
    //register file wires
    //reg_write rs1 rs2 rd
    wire [31:0] read_data1;
    wire [31:0] read_data2;
    
    // directly writes back the ALU result for now.
    register_file uut4(.clk(clk),.reg_write(reg_write),.rs1(rs1),.rs2(rs2),
    .rd(rd), .write_data(alu_output),.read_data1(read_data1),.read_data2(read_data2));
    
    //alu src mux wires
    //alu_src read_data2 immediate
    
    wire [31:0] operand_b;
    
    alu_src_mux uut5(.read_data2(read_data2),.immediate(immediate),
    .alu_src(alu_src),.operand_b(operand_b));
     
     //alu controller wires
     //alu_op funct3 funct 7
     wire [3:0] alu_control;
     
     alu_controller uut6(.alu_op(alu_op), .funct3(funct3), .funct7(funct7),
     .alu_control(alu_control));
     
     alu uut7(.operand_a(read_data1),.operand_b(operand_b),.alu_control(alu_control),
     .result(alu_output));
endmodule
