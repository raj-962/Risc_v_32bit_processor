// and_gate_logic module

module and_gate( and_out , branch , zero );
output and_out;
input wire branch;
input wire zero;

assign and_out = branch & zero;

endmodule