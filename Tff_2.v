`timescale 1ns/1ns
module Tff_2 (
input wire data, clk, rst,
output reg q  
);
//*************code***********//

reg q1;

always @ (posedge clk, negedge rst) begin
    if (~rst) begin
        q1 <= 1'b0;
    end
    else begin
        q1 <= q1 ^ data;
    end
end

always @ (posedge clk, negedge rst) begin
    if (~rst) begin
        q <= 1'b0;
    end
    else begin
        q <= q ^ q1;
    end
end

//*************code***********//
endmodule