`timescale 1ns/1ns
/* verilator lint_off UNUSEDSIGNAL */
/* verilator lint_off UNOPTFLAT */
module CLA_adder #(
  parameter N = 4
)
(
  input       [N-1:0]  A  ,
  input       [N-1:0]  B  ,
  input                Ci ,
  output reg  [N-1:0]  S  ,
  output               Co
);

  wire [N-1:0] P; //propagator A^B
  wire [N-1:0] G; // generator A.B
  wire [N:0] carry; // carrry

  assign carry[0] = Ci;

  genvar i;
  // generator and propagator
  generate 
    for (i = 0; i < N; i = i + 1) begin : G_and_P
      assign G[i] = A[i] & B[i];
      assign P[i] = A[i] ^ B[i];
    end
  endgenerate

  // carry 
  generate 
    for (i = 1; i < N + 1; i = i + 1) begin : carry_caculate
      assign carry[i] = G[i-1] | (P[i-1] & carry[i-1]);
    end
  endgenerate 

  // Sum out
  generate 
    for (i = 0; i < N; i = i + 1) begin : sum
      assign S[i] = A[i] ^ B[i] ^ carry[i];
    end 
  endgenerate

  // Carry out 
  assign Co = carry[N];

endmodule 
