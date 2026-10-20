//integrating the necessary modules for testing R I B and J operations. 
// Contains control Unit, immediate generator, decoder, register file, alu controller
// alu src mux, alu program counter, next pc logic, instruction memory, branch unit
// and writeback mux.
module processor_test_partial2(
    input clk,rst
    );
    //decoder wires
    wire [6:0] opcode;
    wire [4:0] rd;
    wire [2:0] funct3;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [6:0] funct7;
    wire [1:0] wb_sel;
    wire [1:0] next_pc_sel;
    
    wire [31:0] instruction;
    wire [31:0] alu_result;
    
    decoder uut1(.instruction(instruction),.opcode(opcode),.rd(rd),
    .funct3(funct3),.rs1(rs1),.rs2(rs2),.funct7(funct7));
    
    //control unit wires
    wire [1:0] alu_op;
    wire [1:0] alu_src;
    wire reg_write;
    wire [2:0] imm_type;
    
    //only connected the outputs necessary for R I B and J testing
    control_unit_v2 uut2(.opcode(opcode),.alu_op(alu_op),.alu_src(alu_src),
    .reg_write(reg_write), .imm_type(imm_type),.wb_sel(wb_sel), 
    .next_pc_sel(next_pc_sel));
    
    //Imediate generator wire
    wire [31:0] immediate; 
    //imm_type
    
    immediate_generator uut3(.instruction(instruction),.immediate(immediate),
    .imm_type(imm_type));
    
    //register file wires
    //reg_write rs1 rs2 rd
    wire [31:0] read_data1;
    wire [31:0] read_data2;
    wire [31:0] write_data;
    
    // writes alu result or pc plus 4
    register_file uut4(.clk(clk),.reg_write(reg_write),.rs1(rs1),.rs2(rs2),
    .rd(rd), .write_data(write_data),.read_data1(read_data1),.read_data2(read_data2));
    
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
     .result(alu_result));
     
     //Branch unit wires
     wire branch;
     
     branch_unit uut8(.funct3(funct3),.read_data1(read_data1),.read_data2(read_data2),
     .branch(branch));
     
     //Next pc logic wires
     wire [31:0] pc;
     wire [31:0] next_pc;
     wire [31:0] pcplus4;
     
     next_pc_logic uut9(.next_pc_sel(next_pc_sel),.pc(pc),.read_data1(read_data1),
     .immediate(immediate),.branch(branch),.next_pc(next_pc),.pcplus4(pcplus4));
     
     //program counter wires
     //next_pc clk rst pc
     program_counter uut10(.clk(clk),.rst(rst),.next_pc(next_pc),.pc(pc));
     
     instruction_memory uut11(.address(pc),.instruction(instruction));
     
     //writeback mux
     wb_mux uut12(.wb_sel(wb_sel),.alu_result(alu_result),.pcplus4(pcplus4),
     .write_data(write_data));
endmodule
