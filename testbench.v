`timescale 1ns/1ps

module testbench;

  reg clk;
  reg reset;

  datapath dut (
    .clk(clk),
    .rst(reset)
  );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #200;

    $finish;
  end

endmodule
