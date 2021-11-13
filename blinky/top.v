module top(
        output wire led_blue,
        output wire led_green,
        output wire led_red);

    // clock source
    wire clk;
    SB_HFOSC inthosc(.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));

    // blinky
    blinky bl(.clk(clk), .reset(1'b0), .led_blue(led_blue), .led_green(led_green), .led_red(led_red));
endmodule // top
