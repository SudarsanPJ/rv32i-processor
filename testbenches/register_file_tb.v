module register_file_tb(

    );
    reg clk,reg_write;
    reg[4:0] rs1,rs2,rd;
    reg[31:0] write_data;
    wire[31:0] read_data1, read_data2;
    
    register_file uut(.clk(clk),
    .reg_write(reg_write)
    ,.rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2));
    
    always #5 clk = ~clk;
    
    initial begin
    //inital values
    clk = 1'b0;
    reg_write = 1'b0;
    rs1 = 5'd0;
    rs2 = 5'd0;
    rd = 5'd0;
     //make sure it doesnt write to x0
    write_data = 32'd0;
    #10
    write_data = 32'd42;
    rd = 5'd0;
    reg_write = 1'b1; 
    #10 
    
    //actual test
    write_data = 32'd42;
    rd = 5'd5;
    reg_write = 1'b1; 
    #10 
    reg_write = 1'b0;
    rs1 = 5'd5;
    #10
    $finish;
    end
    
endmodule
