module instruction_mem(
    input clk,
    input rst,
    input [31:0] read_addr,
    output reg [31:0] instruction_out
);

    reg [31:0] I_mem[0:63]; // 64 instructions max
 integer i;
    // Combinational read
    always @(*) begin
        instruction_out = I_mem[read_addr >> 2]; // Word-aligned access
    end

    // Initialize instructions
    initial begin
       
        // Clear memory
        for (i = 0; i < 64; i = i + 1) begin
            I_mem[i] = 32'h00000000;
        end

        // Load instructions
        I_mem[0]  = 32'b00000000000000000000000000000000; // nop
        I_mem[1]  = 32'b00000001100110000000001101011001; // add x13 <= x16 , x25
        I_mem[2]  = 32'b01000000001101000000001010110011; // sub x5 <= x8,x3
        I_mem[3]  = 32'b00000000001100010111000010110011; // and x1 <= x2 ,x3
        I_mem[4]  = 32'b00000000010100011110001000110011; // or x4 <= x3,x5

        I_mem[5]  = 32'b00000000001110101000101100010011; // addi x22 <= x21 , 3
        I_mem[6]  = 32'b00000000000101000110010010010011; // ori x9 <= x8 , 1

        I_mem[7]  = 32'b00000000111100101010010000000011; // lw x8, 15(x5)
        I_mem[8]  = 32'b00000000001100011010010010000011; // lw x9 , 3(x3)

        I_mem[9]  = 32'b00000000111100101010011000100011; // sw x15 , 12(x5)
        I_mem[10] = 32'b00000000111000110010010100100011; // sw x14 , 10(x6)

        I_mem[11] = 32'h00948663; // beq x9,x9,12
    end

endmodule
