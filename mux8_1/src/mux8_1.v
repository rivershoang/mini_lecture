`timescale 1ns/1ns

module mux8_1 (
  input        d0, d1, d2, d3, d4, d5, d6, d7,
  input  [2:0] sel,
  output reg   y
);
  
  always@ (*) begin 
    case (sel)
      3'd0: y = d0;
      3'd1: y = d1;
      3'd2: y = d2;
      3'd3: y = d3;
      3'd4: y = d4;
      3'd5: y = d5;
      3'd6: y = d6;
      3'd7: y = d7;
      default: y = 0;
    endcase 
  end

endmodule 
