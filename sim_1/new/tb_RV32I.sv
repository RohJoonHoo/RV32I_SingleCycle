`timescale 1ns / 1ps

module tb_RV32I ();

    logic clk;
    logic reset;

    MCU dut (.*);

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1;
        #10 reset = 0;
        #100 $finish;
    end
endmodule
