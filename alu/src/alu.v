`timescale 1ns/1ns
module alu #(
  parameter N = 8
)
(
  input      [N-1:0]  A       ,
  input      [N-1:0]  B       ,
  input      [3:0]    sel     ,
  output reg [N-1:0]  result  ,
  output reg          overflow,
  output reg          zero    ,
  output reg          negative
);

  always @(*) begin
	overflow = 0;
	zero = 0;
	negative = 0; 
    case (sel) 
      4'b0000: {overflow,result} = A + B;
      4'b0001: {overflow,result} = A - B;
   // 4'b0010: sum = A * B; // mult and div must be design seperate
   // 4'b0011: sum = A /B;
      4'b0100: result = A & B;
      4'b0101: result = A | B;
      4'b0110: result = ~(A & B);
      4'b0111: result = ~(A | B);
      4'b1000: result = A ^ B;
      4'b1001: result = ~(A ^ B);
      4'b1010: result = ~A;
      default: result = 0;
    endcase
    if (result == 0) zero = 1;
    else zero = 0;
    if (result[7] == 1) negative = 1;
    else negative = 0;
  end

endmodule

