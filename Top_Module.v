// This is the toP MODULE WHERE ALL OTHER MODULES ARE INSTANTIATED
//implimenting and connecting all wires 
module Top_Module( clk , rst);

input clk , rst ;

wire [31:0] PC_top,branch_target, instruction_top, read_data1_top, read_data2_top, ImmExt_top , Mux1_out_top , NexttoPc_top , Sum_out_top , Pc_in_top , ALU_out_top , Mem_data_out_top , write_back_top;;
wire Reg_write_top , ALUSrc_top ,branch_top , zero_top , and_out_top , Mem_Write_top , MemtoReg_top , Memreadc_top , Mem_Read_top;
wire [1:0]ALUOp_top;
wire [3:0]Control_out_top;

// Program_Counter_instant
program_counter PC( .clk(clk) , .rst(rst) , .pc_in(Pc_in_top) , .pc_out(PC_top) ); // instantiation syntax

//PC_Adder_instant
pcplus4 Pc_adder( .fromPc(PC_top) , .NexttoPc(NexttoPc_top));

//Instruction_Memory_instant
instruction_mem instruction_mem( .clk(clk), .rst(rst), .read_addr(PC_top) , .instruction_out(instruction_top));


reg_file u_reg_file(
    .clk        	(clk         ),
    .rst        	(rst         ),
    .Reg_write  	(Reg_write_top   ),
    .Rs1        	(instruction_top[19:15]        ),
    .Rs2        	(instruction_top[24:20]        ),
    .Rd         	(instruction_top[11:7]         ),
    .write_data 	(write_back_top  ),
    .read_data1 	(read_data1_top ),
    .read_data2 	(read_data2_top )
);



//im
Immidiate_generator u_Immidiate_generator(.instruction(instruction_top), .ImmExt(ImmExt_top));


//Control_unit_instant
controlunit control_unit( .instruction(instruction_top[6:0])  , .branch(branch_top) , .Memread(Mem_Read_top) , .MemtoReg(MemtoReg_top) , .ALUOp(ALUOp_top) , .MemWrite(Mem_Write_top ) , .ALUSrc(ALUSrc_top) , .Reg_write(Reg_write_top));

//AlU_control_instant
alu_control alu_control( .ALUOp(ALUOp_top) , .fun7(instruction_top[31:25]) , .fun3(instruction_top[14:12]) , .Control_out(Control_out_top) );

//alu_unit_instant
alu_unit alu_unit( .A(read_data1_top) , .B(Mux1_out_top) , .control_in(Control_out_top) , .zero(zero_top) , .ALU_out(ALU_out_top) );


//Data_memory_instant
data_memory data_memory( .clk(clk) , .rst(rst) , .Mem_Write(Mem_Write_top) , .Mem_Read(Mem_Read_top) , .Read_addr(ALU_out_top) , .Write_Data(read_data2_top) , .Mem_data_out(Mem_data_out_top) );

//multiplexer_instant_1_2_3
mux_1  mux_1_Alu( .Sel1(ALUSrc_top) , .A1(read_data2_top) , .B1( ImmExt_top) , .Mux1_out(Mux1_out_top));

mux_2  mux_2_adder_pc( .Sel2(branch_top& zero_top) , .A2(NexttoPc_top) , .B2(branch_target) , .Mux2_out(Pc_in_top));


mux_3  mux_3_data_mem( .Sel3(MemtoReg_top) , .A3(ALU_out_top) , .B3(Mem_data_out_top) , .Mux3_out(write_back_top));


Branch_Adder u_Branch_Adder(
    .PC            	(PC_top             ),
    .offset        	(ImmExt_top        ),
    .branch_target 	(branch_target  )
);


endmodule