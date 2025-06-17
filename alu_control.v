// Alu control unit which signals the alu
module alu_control ( ALUOp , fun7 , fun3 , Control_out );
input [6:0]fun7;
input [2:0]fun3;
input [1:0]ALUOp;
output reg [3:0]Control_out;

always@(*)
begin
    case({ALUOp,fun7,fun3})
    12'b10_0000000_000 : Control_out <= 4'b0000;    // ADD 
    12'b00_0000000_000 : Control_out <= 4'b0000;    // ADD 
    12'b00_0000000_001 : Control_out <= 4'b0000;    // ADD 
    12'b00_0000000_010 : Control_out <= 4'b0000;    // ADD 
    12'b10_0100000_000 : Control_out <= 4'b0001;    // SUB 
    12'b10_0000000_111 : Control_out <= 4'b0010;    // AND
    12'b10_0000000_110 : Control_out <= 4'b0011;    // OR
    12'b10_0000000_100 : Control_out <= 4'b0100;    // XOR
    12'b10_0000000_001 : Control_out <= 4'b0101;    // SLL
    12'b10_0000000_101 : Control_out <= 4'b0110;    // SRL
    12'b10_0100000_101 : Control_out <= 4'b0111;    // SRA
    12'b10_0000000_010 : Control_out <= 4'b1000;    // SLT
    default            : Control_out <= 4'b0000; 
endcase
end
endmodule //alu_control
