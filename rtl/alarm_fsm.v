//====================================================
// Alarm Comparator
//====================================================

module alarm_fsm(

    input  wire clk,
    input  wire rst,

    input  wire alarm_enable,

    input  wire [4:0] current_hr,
    input  wire [5:0] current_min,

    input  wire [4:0] alarm_hr,
    input  wire [5:0] alarm_min,

    output reg alarm_out

);

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        alarm_out <= 0;
    end

    else
    begin

        if(alarm_enable &&
           (current_hr  == alarm_hr) &&
           (current_min == alarm_min))
        begin
            alarm_out <= 1;
        end

        else
        begin
            alarm_out <= 0;
        end

    end

end

endmodule