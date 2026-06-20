//====================================================
// Top Module
//====================================================

module top(

    input wire clk,
    input wire rst,

    input wire alarm_enable,

    input wire [4:0] alarm_hr,
    input wire [5:0] alarm_min,

    output wire alarm_out,

    output wire [5:0] sec,
    output wire [5:0] min,
    output wire [4:0] hr

);

    //------------------------------------------------
    // Clock Tick
    //------------------------------------------------

    wire tick_1hz;

    clk_en #(
        .CLK_HZ(100),
        .TICK_HZ(10)
    )
    U_CLK (

        .clk(clk),
        .rst(rst),
        .tick(tick_1hz)

    );

    //------------------------------------------------
    // Time Core
    //------------------------------------------------

    time_core U_TIME (

        .clk(clk),
        .rst(rst),
        .tick_1hz(tick_1hz),

        .sec(sec),
        .min(min),
        .hr(hr)

    );

    //------------------------------------------------
    // Alarm Comparator
    //------------------------------------------------

    alarm_fsm U_ALARM (

        .clk(clk),
        .rst(rst),

        .alarm_enable(alarm_enable),

        .current_hr(hr),
        .current_min(min),

        .alarm_hr(alarm_hr),
        .alarm_min(alarm_min),

        .alarm_out(alarm_out)

    );

endmodule