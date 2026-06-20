`timescale 1ns/1ps

module alarm_tb;

    reg clk;
    reg rst;

    reg alarm_enable;

    reg [4:0] alarm_hr;
    reg [5:0] alarm_min;

    wire [5:0] sec;
    wire [5:0] min;
    wire [4:0] hr;

    wire alarm_out;

    top DUT (

        .clk(clk),
        .rst(rst),

        .alarm_enable(alarm_enable),

        .alarm_hr(alarm_hr),
        .alarm_min(alarm_min),

        .alarm_out(alarm_out),

        .sec(sec),
        .min(min),
        .hr(hr)

    );

    always #5 clk = ~clk;

    initial
    begin

        $dumpfile("simulation/alarm.vcd");
        $dumpvars(0, alarm_tb);

        clk = 0;
        rst = 1;

        alarm_enable = 1;

        // Trigger when time reaches 00:01
        alarm_hr  = 0;
        alarm_min = 1;

        #20;
        rst = 0;

        #20000;


        $finish;

    end

endmodule