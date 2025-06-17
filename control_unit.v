// c0ontrol unit implimentation uding table 

module controlunit ( instruction  , branch , Memread , MemtoReg ,ALUOp , MemWrite ,ALUSrc ,Reg_write);

input [6:0] instruction;
output  reg branch , Memread , MemtoReg ,MemWrite , ALUSrc ,Reg_write ;
output reg [1:0]ALUOp;

always@(*)begin 
 case(instruction)

    7'b0110011 : {ALUSrc , MemtoReg , Reg_write ,Memread, MemWrite , branch , ALUOp} <= 9'b001000_10;
    7'b0000011 : {ALUSrc , MemtoReg , Reg_write ,Memread, MemWrite , branch , ALUOp} <= 9'b111100_00;
    7'b0100011 : {ALUSrc , MemtoReg , Reg_write ,Memread, MemWrite , branch , ALUOp} <= 9'b100010_00;
    7'b1100011 : {ALUSrc , MemtoReg , Reg_write ,Memread, MemWrite , branch , ALUOp} <= 9'b000001_11;
    7'b0010011 : {ALUSrc , MemtoReg , Reg_write ,Memread, MemWrite , branch , ALUOp} <= 9'b101000_10;
    default : {ALUSrc , MemtoReg , Reg_write ,Memread, MemWrite , branch , ALUOp} =9'b0;

endcase

end
endmodule //controlunit