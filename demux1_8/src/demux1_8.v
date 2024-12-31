`timescale 1ns/1ns
module demux1_8 (
  input       y,
  input [2:0] sel,
  output reg  i0,i1,i2,i3,i4,i5,i6,i7 
);
 
  always @(*) begin
    i0 = 0;
    i1 = 0;
    i2 = 0;
    i3 = 0;
    i4 = 0;
    i5 = 0;
    i6 = 0;
    i7 = 0;
    case (sel)
      3'b000: i0 = y;
      3'b001: i1 = y;
      3'b010: i2 = y;
      3'b011: i3 = y;
      3'b100: i4 = y;
      3'b101: i5 = y;
      3'b110: i6 = y;
      3'b111: i7 = y;
      default: begin 
        i0 = 0;
        i1 = 0;
        i2 = 0;
        i3 = 0;
        i4 = 0;
        i5 = 0;
        i6 = 0;
        i7 = 0;
      end
    endcase
  end

endmodule 
