// Alu control unit which signals the alu

module alu_control ( ALUOp , fun7 , fun3 , Control_out );

input fun7;
input [2:0]fun3;
input [1:0]ALUOp;
output reg [3:0]Control_out;

always@(*)
begin
    case({ALUOp,fun7,fun3})

    6'b00_0_000 : Control_out <= 4'b0010;
    6'b01_0_001 : Control_out <= 4'b0110;
    6'b10_0_000 : Control_out <= 4'b0010;
    6'b10_1_000 : Control_out <= 4'b0110;
    6'b10_0_111 : Control_out <= 4'b0000;
    6'b10_0_110 : Control_out <= 4'b0001;
    default : Control_out <=4'b0;  //added now
endcase
end
endmodule //alu_control