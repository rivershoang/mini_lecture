`timescale 1ns/1ns
module decoder3_8 #(
  parameter WIDTH_IN = 3,
            WIDTH_OUT = 8
)
( 
  input       [WIDTH_IN-1:0]  A_in,
  output reg  [WIDTH_OUT-1:0] Y_out
);
  
  assign Y_out =  (1'b1 << A_in); 

 endmodule 
