`timescale 1ns/1ns
module full_adder (
  input       x,
  input       y,
  input       Ci,
  output reg  S,
  output reg  Co
);

  assign S = x ^ y ^ Ci;

  assign Co = ((x ^ y) & Ci) ^ (x & y); 
 
 endmodule 
  
