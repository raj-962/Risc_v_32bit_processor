//program counter
// type of register which holds the address of next instruction
module program_counter ( clk , rst , pc_in , pc_out );
    input clk,rst;
    input       [31:0]pc_in;  // 32 bit 
    output reg  [31:0]pc_out; //32 bit register

    always @(posedge clk or posedge rst) begin
        if (rst)
        pc_out <=32'b00;
        else
            pc_out <=pc_in;
        end
    
endmodule