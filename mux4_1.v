`timescale 1ns/1ns
module mux4_1(
input  [1:0] d1,d2,d3,d0,
input  [1:0] sel,
output [1:0] mux_out
);
//*************code***********//

reg [1:0] reg_mux_out;

always @(*) begin
    case(sel)
        2'b00: begin reg_mux_out = d3; end
        2'b01: begin reg_mux_out = d2; end
        2'b10: begin reg_mux_out = d1; end
        2'b11: begin reg_mux_out = d0; end
        default: begin reg_mux_out = d0; end
    endcase
end

assign mux_out = reg_mux_out;

//*************code***********//
endmodule