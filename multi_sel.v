`timescale 1ns/1ns
module multi_sel(
input [7:0] d,
input clk,
input rst,
output reg input_grant,
output reg [10:0] out
);
//*************code***********//

wire [3:0] times[3:0];
assign times[0] = 4'd1;
assign times[1] = 4'd3;
assign times[2] = 4'd7;
assign times[3] = 4'd8;

reg [7:0] data;
reg [2:0] i;

// 更新乘数，存储数据 d
always @ (posedge clk or negedge rst) begin
  if (~rst) begin
    out <= 1'b0;
    i <= 3'd0;
  end
  else begin
    if (i >= 3'd3) begin
      i <= 3'd0;
      data <= d;
    end
    else begin
      i <= i + 3'd1;
    end
  end
end

// 更新 input_grant
always @ (posedge clk or negedge rst) begin
  if (~rst) begin
    input_grant <= 1'b0;
  end
  else begin
    if (i == 3'd0) begin
      input_grant <= 1'b1;
    end
    else begin
      input_grant <= 1'b0;
    end
  end
end

// 更新 out
always @ (posedge clk or negedge rst) begin
  if (~rst) begin
    input_grant <= 1'b0;
    out <= 1'b0;
    i <= 3'd0;
  end
  else begin
    case (i)
      3'd0: begin
        out <= d;
        data <= d;
      end
      3'd1: begin
        out <= data * times[i];
      end
      3'd2: begin
        out <= data * times[i];
      end
      3'd3: begin
        out <= data * times[i];
      end
      default: out <= d * times[i];
    endcase
  end
end

//*************code***********//
endmodule