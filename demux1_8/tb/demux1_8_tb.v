`timescale 1ns/1ns
module demux1_8_tb();
  wire i0,i1,i2,i3,i4,i5,i6,i7;
  reg [2:0] sel;
  reg y;
  reg [7:0] result;
 
  initial begin
    $dumpfile ("wave.vcd");
    $dumpvars (0,dut);
  end

  assign result = {i7,i6,i5,i4,i3,i2,i1,i0};

  demux1_8 dut(
    .i0   (i0)  ,
    .i1   (i1)  ,
    .i2   (i2)  ,
    .i3   (i3)  ,
    .i4   (i4)  ,
    .i5   (i5)  ,
    .i6   (i6)  ,
    .i7   (i7)  ,
    .sel  (sel) ,
    .y    (y)
  );

  initial begin
    $display ("Start Simulate...");

    sel = 3'b000; y = 1; 
    #10;
    if (result == 8'b00000001) $display ("PASSED i0"); else $error;

    sel = 3'b001; y = 1; 
    #10;
    if (result == 8'b00000010) $display ("PASSED i1"); else $error;
 
    sel = 3'b010; y = 1;
    #10; 
    if (result == 8'b00000100) $display ("PASSED i2"); else $error;
 
     sel = 3'b011; y = 1;
    #10; 
    if (result == 8'b00001000) $display ("PASSED i3"); else $error;
   
     sel = 3'b100; y = 1;
    #10; 
    if (result == 8'b00010000) $display ("PASSED i4"); else $error;
   
     sel = 3'b101; y = 1; 
   #10;
    if (result == 8'b00100000) $display ("PASSED i5"); else $error;
    
    sel = 3'b110; y = 1; 
    #10;
    if (result == 8'b01000000) $display ("PASSED i6"); else $error;
    
     sel = 3'b111; y = 1;
    #10; 
    if (result == 8'b10000000) $display ("PASSED i7"); else $error;

    $display ("Done simulate"); 
    $stop;
    end

 endmodule
