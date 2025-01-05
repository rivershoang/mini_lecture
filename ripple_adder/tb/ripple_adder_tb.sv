`timescale 1ns/1ns
/* verilator lint_off WIDTHTRUNC */
/* verilator lint_off UNUSEDSIGNAL */

module ripple_adder_tb ();
  parameter N = 4;
  reg [N-1:0] x,y;
  reg Ci;
  wire [N-1:0] S;
  wire Co;

  initial begin 
    $dumpfile ("wave.vcd");
    $dumpvars (0, dut);
  end

  ripple_adder dut (
    .x  (x) ,
    .y  (y) ,
    .Ci (Ci),
    .S  (S) ,
    .Co (Co)
  );

  initial begin 
    for (int i = 0; i < 10; i = i + 1) begin 
      x = $urandom %16;
      y = $urandom %16;
      Ci = $urandom %2;
      #1;
      $display ("x = %b , y = %b, Ci = %b, Co = %b , S = %b",x, y, Ci, Co, S); 
    end
  end
  
endmodule 

