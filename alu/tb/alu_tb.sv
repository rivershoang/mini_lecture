/* verilator lint_off WIDTHTRUNC */
`timescale 1ns/1ns
module alu_tb ();
  parameter N = 8;
  reg [N-1:0] A,B;
  reg [3:0] sel;
  wire [N-1:0] result;
  wire overflow, negative, zero;

  initial begin
    $dumpfile ("wave.vcd");
    $dumpvars (0,dut);
  end

  alu dut (
    .A        (A)       ,
    .B        (B)       ,
    .sel      (sel)     ,
    .result   (result)  ,
    .overflow (overflow),
    .negative (negative),
    .zero     (zero)
  );

  initial begin 
    for (int i = 0; i < 10; i = i + 1) begin 
      sel = i;
      A = $random ();
      B = $random ();
      #1;
      $display ("A = %b, B = %b, sel = %b,overflow = %b, result = %b, zero = %b, negative = %b/n", A, B, sel , overflow, result, zero, negative);
    end
    $finish;
  end
  
 endmodule
