/* verilator lint_off WIDTHEXPAND */
`timescale 1ns/1ns
module add_sub #( 
  parameter N = 4
)
(
  input      [N-1:0]  A   ,
  input      [N-1:0]  B   ,
  input               sel ,
  output reg [N-1:0]  S   ,
  output reg          Cout
);

  always @(*) begin
    if (~sel) begin
     {Cout, S} = A + B;
   end else begin
     {Cout, S} = A + (~B +1);
   end
 end

endmodule 
