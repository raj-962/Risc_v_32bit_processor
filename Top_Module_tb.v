module Top_Module_tb;
     reg clk, rst;

    // Instantiate the DUT (Device Under Test)
Top_Module uut(
    .clk 	(clk  ),
    .rst 	(rst  )
);
    // Clock generation
    always #5 clk = ~clk;  // 10ns clock period

    // Monitor essential signals for debug
    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, Top_Module_tb);

        $display("\nTime\tPC\tInstr\tALU_out\tMem_out\tReg_write_data");
        $monitor("%0t\t%h\t%h\t%h\t%h\t%h",
                 $time,
                 uut.PC_top,
                 uut.instruction_top,
                 uut.ALU_out_top,
                 uut.Mem_data_out_top,
                 uut.write_back_top
        );

        // Simulation setup
        clk = 0;
        rst = 1;
        #12 rst = 0;

        // Let the processor run for some cycles
        #3000;

        $finish;
    end
endmodule