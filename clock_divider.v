`timescale 1ns / 1ps

module clock_divider(divided_clock, clock, reset);
    input clock, reset;
    output divided_clock;
    reg divided_clock = 0;
    parameter ratio = 10;
    integer now = 1;
    always @(posedge clock or posedge reset) begin
        if (reset == 1) now = 1;
        else begin
            if (now <= ratio / 2) divided_clock = 1;
            else divided_clock = 0;
            if (now == ratio) now = 1;
            else now = now + 1;
        end
    end
endmodule
