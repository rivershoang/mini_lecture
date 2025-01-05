`timescale 1ns/1ns
/* verilator lint_off UNUSEDSIGNAL */
module ripple_adder #(
  parameter N = 4
)
(
  input [N-1:0]       x ,
  input [N-1:0]       y ,
  input               Ci,
  output reg [N-1:0]  S ,
  output reg          Co
);
  
  wire [N:0] carry;

  genvar i;
  generate 
    for (i = 0; i < N; i = i + 1) begin : ripple_carry_adder
      full_adder FA (
        .x  (x[i])    ,
        .y  (y[i])    ,
        .Ci (carry[i]),
        .S  (S[i])    ,
        .Co (carry[i+1])
      );
    end
  endgenerate

  assign carry[0] = Ci; // first adder is Cin 

  assign Co = carry[N]; // Cout is carry at i = 3 so that carry [4]

endmodule 
