/*
 * blinky_tb.v : blinky testbench
 */

module blinky_tb;

    localparam N = 4;

    reg reset = 0;
    initial begin
        $dumpfile("blinky_tb.vcd");
        $dumpvars(0, blinky_tb);
        #1 reset = 1;
        #2 reset = 0;
        #(3*(1<<(N+2))) $finish;
    end 

    /* setup clk */
    reg clk = 0;
    always #1 clk = !clk;

    /* outputs */
    wire led_blue;
    wire led_green;
    wire led_red;
    blinky #(N) dut (clk, reset, led_blue, led_green, led_red);

    initial begin
        $monitor("%t: Orange->%h (%0d), Green->%h (%0d), Red->%h (%0d)", $time, led_blue, led_blue,
            led_green, led_green,
            led_red, led_red);
    end
endmodule // blinky_tb
