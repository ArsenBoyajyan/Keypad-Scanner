`timescale 1ns / 1ps

module keypad_encoder(code, AN, row, col, state, clock, reset);
    input [3:0] row, col;
    input clock, reset;
    input [2:0] state;
    output [3:0] code, AN;
    reg [3:0] code=0, AN=4'b1111;
    always @(posedge clock or posedge reset) begin
        if (reset) begin AN=4'b1111; end
        else if (state!=5) begin AN=4'b1111; end
        else begin
            if      (row==4'b0001 && col==4'b0001) begin code=4'b0000; AN=4'b1110; end
            else if (row==4'b0001 && col==4'b0010) begin code=4'b0001; AN=4'b1110; end
            else if (row==4'b0001 && col==4'b0100) begin code=4'b0010; AN=4'b1110; end
            else if (row==4'b0001 && col==4'b1000) begin code=4'b0011; AN=4'b1110; end
            else if (row==4'b0010 && col==4'b0001) begin code=4'b0100; AN=4'b1110; end
            else if (row==4'b0010 && col==4'b0010) begin code=4'b0101; AN=4'b1110; end
            else if (row==4'b0010 && col==4'b0100) begin code=4'b0110; AN=4'b1110; end
            else if (row==4'b0010 && col==4'b1000) begin code=4'b0111; AN=4'b1110; end
            else if (row==4'b0100 && col==4'b0001) begin code=4'b1000; AN=4'b1110; end
            else if (row==4'b0100 && col==4'b0010) begin code=4'b1001; AN=4'b1110; end
            else if (row==4'b0100 && col==4'b0100) begin code=4'b1010; AN=4'b1110; end
            else if (row==4'b0100 && col==4'b1000) begin code=4'b1011; AN=4'b1110; end
            else if (row==4'b1000 && col==4'b0001) begin code=4'b1100; AN=4'b1110; end
            else if (row==4'b1000 && col==4'b0010) begin code=4'b1101; AN=4'b1110; end
            else if (row==4'b1000 && col==4'b0100) begin code=4'b1110; AN=4'b1110; end
            else if (row==4'b1000 && col==4'b1000) begin code=4'b1111; AN=4'b1110; end
            else AN=4'b1110;
        end
    end
endmodule
