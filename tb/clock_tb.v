`timescale 1ns/1ps

module clock_tb;

    reg clk;
    reg rst;

    reg tick_1hz;

    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hr;

    // DUT
    time_core DUT (
        .clk(clk),
        .rst(rst),
        .tick_1hz(tick_1hz),
        .sec(sec),
        .min(min),
        .hr(hr)
    );

    //------------------------------------------------
    // Clock Generation
    //------------------------------------------------
    always #5 clk = ~clk;

    //------------------------------------------------
    // Test Sequence
    //------------------------------------------------
    initial
    begin

        $dumpfile("simulation/clock.vcd");
        $dumpvars(0, clock_tb);

        clk      = 0;
        rst      = 1;
        tick_1hz = 0;

        #20;
        rst = 0;

        // Generate 150 seconds worth of ticks
        repeat(150)
        begin
            #20 tick_1hz = 1;
            #10 tick_1hz = 0;
        end

        #100;
        $finish;

    end

endmodule