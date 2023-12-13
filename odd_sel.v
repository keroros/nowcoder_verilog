`timescale 1ns/1ns
module odd_sel(
input [31:0] bus,
input sel,
output check
);
//*************code***********//

reg check;
reg ans;

always @ (*) begin
  ans <= ^bus;
  if (sel == 1) begin
    check <= ans;
  end
  else begin
    check <= ~ans;
  end
end

//*************code***********//
endmodule