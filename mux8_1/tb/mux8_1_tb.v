`timescale 1ns/1ns
/* verilator lint_off WIDTHTRUNC */
/* verilator lint_off UNDRIVEN */
/* verilator lint_off UNUSEDSIGNAL */
module mux8_1_tb ();
  reg d0, d1, d2, d3, d4, d5, d6, d7;
  reg [2:0] sel;
  wire y;
  
  // dump file vcd
  initial begin 
    $dumpfile ("wave.vcd");
    $dumpvars (0, dut);
  end

  // call instance for test
  mux8_1 dut (
    .d0   (d0)  ,
    .d1   (d1)  ,
    .d2   (d2)  ,  
    .d3   (d3)  ,
    .d4   (d4)  ,
    .d5   (d5)  ,
    .d6   (d6)  ,
    .d7   (d7)  ,
    .sel  (sel) ,
    .y    (y)
  );

  // test cases
 /*  initial begin
    // randome input 
    repeat (10) begin
      d0 = $urandom_range(0, 1); 
      d1 = $urandom_range(0, 1);  
      d2 = $urandom_range(0, 1);
      d3 = $urandom_range(0, 1);
      d4 = $urandom_range(0, 1);
      d5 = $urandom_range(0, 1);
      d6 = $urandom_range(0, 1); 
      d7 = $urandom_range(0, 1);
    end
    // wait 5ns
    #5;

    // check output 
    case (sel) 
      3'd0: if (y !== d0) $error ("Test FAILED for sel = 0");
      3'd1: if (y !== d1) $error ("Test FAILED for sel = 1");
      3'd2: if (y !== d2) $error ("Test FAILED for sel = 2");
      3'd3: if (y !== d3) $error ("Test FAILED for sel = 3");
      3'd4: if (y !== d4) $error ("Test FAILED for sel = 4");
      3'd5: if (y !== d5) $error ("Test FAILED for sel = 5");
      3'd6: if (y !== d6) $error ("Test FAILED for sel = 6");
      3'd7: if (y !== d7) $error ("Test FAILED for sel = 7");
      default: $display ("invalid select");
    endcase

    $display ("All tests PASSED");
    $finish;
  end
*/ 
  
  initial begin
    d0 = 1; d1 = 0; d2 = 1; d3 = 0; d4 = 0; d5 = 1; d6 = 1; d7 = 0;
    repeat (10) begin
      sel = $random %8;
      #5; // delay 5ns for each sel
    end
    $finish;
  end

endmodule 
