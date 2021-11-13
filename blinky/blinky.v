/*
 * blinky.v : Blinky demo for upduino
 */

module blinky (
            input wire clk,
            input wire reset,
            output wire led_blue,
            output wire led_green,
            output wire led_red);

    parameter N = 27;
    reg [N:0] counter;

    // combinational logic
    assign led_blue = counter[N];
    assign led_green = counter[N-1];
    assign led_red = counter[N-2];

    // sequential logic
    always @(posedge clk) begin
        if (reset)
            counter <= 0;
        else
            counter <= counter + 1;
    end
endmodule
