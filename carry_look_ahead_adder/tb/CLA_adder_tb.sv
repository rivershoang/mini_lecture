`timescale 1ns/1ns
/* verilator lint_off WIDTHTRUNC */
/* verilator lint_off UNUSEDSIGNAL */

module CLA_adder_tb ();
  parameter N = 4;
  reg [N-1:0] A, B;
  reg Ci;
  wire [N-1:0] S;
  wire Co;
  wire [N:0] result;

  assign result = {Co,S};

  initial begin
    $dumpfile ("wave.vcd");
    $dumpvars (0, dut);
  end

  CLA_adder dut (
    .A  (A) ,
    .B  (B) ,
    .Ci (Ci),
    .S  (S) ,
    .Co (Co)
  );

  initial begin 
    for (int i = 0; i < 10; i = i + 1) begin 
      A = $urandom %16;
      B = $urandom %16;
      Ci = $urandom %2;
      #1;
      $display ("A = %d , B = %d, Ci = %d, Co = %d , S = %d, result = %d", A, B, Ci, Co, S, result); 
    end
  end
  
endmodule 
