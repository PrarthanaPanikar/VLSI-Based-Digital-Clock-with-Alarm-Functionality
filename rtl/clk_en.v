//====================================================
// Clock Enable Generator
// Generates single-cycle tick pulse
//====================================================

module clk_en #(
    parameter CLK_HZ  = 100,
    parameter TICK_HZ = 10
)(
    input  wire clk,
    input  wire rst,

    output reg tick
);

    localparam DIVISOR = CLK_HZ / TICK_HZ;

    integer counter;

    always @(posedge clk or posedge rst)
    begin
        if (rst)
        begin
            counter <= 0;
            tick    <= 0;
        end
        else
        begin
            tick <= 0;

            if(counter == DIVISOR-1)
            begin
                counter <= 0;
                tick <= 1;
            end
            else
            begin
                counter <= counter + 1;
            end
        end
    end

endmodule