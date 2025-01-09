/* verilator lint_off WIDTHEXPAND */
/* verilator lint_off WIDTHTRUNC */
/* verilator lint_off UNDRIVEN */
`timescale 1ns/1ns
module add_sub_tb ();
  parameter N = 4;

  wire [N-1:0] S;
  wire         Cout;
  reg  [N-1:0] A,B;
  reg          sel;

  initial begin
    $dumpfile ("wave.vcd");
    $dumpvars (0, dut);
  end

  add_sub dut (
    .A    (A)   ,
    .B    (B)   ,
    .sel  (sel) ,
    .S    (S)   ,
    .Cout (Cout)
  );

  task check (input [N-1:0] A_c, input [N-1:0] B_c, input sel_check);
  logic [N:0] result;
  if (~sel_check) begin
    result = A_c + B_c;
  end else begin
    result = A_c - B_c;
  end 
  #1;
  assert (result == {Cout,S}) $display ("PASSED"); 
  else $display ("FAILED at A = %b, B = %b, sel = %b, Cout = %b, S = %b", A, B, sel, Cout, S);

  endtask

  initial begin
    for (int i = 0; i < 10; i = i + 1) begin
      A = $urandom % 16; 
      B = $urandom % 16;
      check (A, B, sel);
      #5;
    end
  end

endmodule 

    




