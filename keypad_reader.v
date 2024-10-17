`timescale 1ns / 1ps

module keypad_scanner(col_out, C, AN, row_in, clock, reset);
    input clock, reset;
    input [3:0] row_in;
    output [3:0] col_out, AN;
    output [6:0] C;
    wire clock_new;
    wire [3:0] code;
    reg [2:0] state=0;
    reg [3:0] col_out=4'b1111;
    
    wire or_row_in;
    
    reg [3:0] col, row;
    
    clock_divider #(500000) cd(clock_new, clock, reset);
    keypad_encoder ke(code, AN, row, col, state, clock_new, reset);
    ssd_driver ssd(C, code);
    
    assign or_row_in = row_in[0] | row_in[1] | row_in[2] | row_in[3];
    
    always @(posedge clock_new or posedge reset)
        if (reset) begin    
            state=0;
            col_out=4'b1111;
        end
        else case (state)
                3'd0: if (or_row_in) begin
                        state=1;
                        col_out=4'b0001;
                    end
                3'd1: if (or_row_in) begin 
                        state=5;
                        col=4'b0001;
                        row=row_in;
                        col_out=4'b1111;
                    end
                    else begin 
                        state=2;
                        col_out=4'b0010;
                    end
                3'd2: if (or_row_in) begin 
                        state=5;
                        col=4'b0010;
                        row=row_in;
                        col_out=4'b1111;
                    end
                    else begin 
                        state=3;
                        col_out=4'b0100;
                    end
                3'd3: if (or_row_in) begin 
                        state=5;
                        col=4'b0100;
                        row=row_in;
                        col_out=4'b1111;
                    end
                    else begin 
                        state=4;
                        col_out=4'b1000;
                    end
                3'd4: if (or_row_in) begin 
                        state=5;
                        col=4'b1000;
                        row=row_in;
                        col_out=4'b1111;
                    end
                    else begin 
                        state=0;
                        col_out=4'b1111;
                    end
                3'd5: if (or_row_in) begin
                        col_out=4'b1111;
                    end
                    else begin
                        state=0;
                        col_out=4'b1111;
                    end
            endcase
endmodule
