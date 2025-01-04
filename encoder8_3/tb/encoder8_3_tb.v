`timescale 1ns/1ns
/* verilator lint_off WIDTHEXPAND */
module encoder8_3_tb ();
  wire x,y,z;
  reg [7:0] D;
  
  initial begin 
    $dumpfile ("wave.vcd");
    $dumpvars (0,dut);
  end

  encoder8_3 dut (
    .D (D),
    .x (x),
    .y (y),
    .z (z)
  );

  initial begin
    for (int j = 0; j < 8; j = j + 1) begin 
      D = 1 << j;
      #5;
      assert ({x,y,z} == j) $display ("PASSED");
      else  $display ("FAILED at x = %b, y = %b, z = %b ", x, y, z);
    end
  end

endmodule 
