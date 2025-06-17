//program counter + 4 add operation
module pcplus4 (fromPc,NexttoPc);
    input [31:0]fromPc;
    output [31:0]NexttoPc;

    assign NexttoPc = 4 + fromPc;
    
endmodule //pcplus4