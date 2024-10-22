
`timescale 1ns/1ns

module tb_fifo_sync();
  
  parameter fifo_depth = 8;
  parameter data_width = 32;
  reg clk = 0;
  reg rst_n;
  reg cs;
  reg wr_en;
  reg rd_en;
  reg [data_width-1:0] data_in;
  wire [data_width-1:0] data_out;
  wire empty;
  wire full;
  
  integer i;
  
  // Instantiate FIFO module
  fifo_sync
  #(.fifo_depth(fifo_depth),
    .data_width(data_width))
  dut
  (.clk(clk),
   .rst_n(rst_n),
   .cs(cs),
   .wr_en(wr_en),
   .rd_en(rd_en),
   .data_in(data_in),
   .data_out(data_out),
   .empty(empty),
   .full(full));
  
  // Generate clock signal
  always begin 
    #5 clk = ~clk; 
  end
  
  // Write task
  task write_data(input [data_width-1:0] d_in);
    begin 
      @(posedge clk);
      cs = 1; wr_en = 1; rd_en = 0;
      data_in = d_in;
      $display($time , " Writing data: %d", data_in);
      @(posedge clk);
      wr_en = 0;
    end
  endtask
  
  // Read task
  task read_data();
    begin 
      @(posedge clk);
      cs = 1; wr_en = 0; rd_en = 1;
      @(posedge clk);
      $display($time , " Reading data: %d", data_out);
      rd_en = 0;
    end
  endtask
  
  // Testbench process
  initial begin
    rst_n = 0; cs = 0; wr_en = 0; rd_en = 0;
    data_in = 0;
    
    // Apply reset
    #10 rst_n = 1;
    
    // Test case 1: Simple write and read
    $display($time, "\nTest case 1: Write and read");
    write_data(1);
    write_data(10);
    write_data(100);
    read_data();
    read_data();
    read_data();
    
    // Test case 2: Fill FIFO and read back
    $display($time, "\nTest case 2: Fill FIFO and read back");
    for (i=0; i<fifo_depth; i=i+1)
      write_data(i+1);
    
    for (i=0; i<fifo_depth; i=i+1)
      read_data();

    // Test case 3: Write to full FIFO and read until empty
    $display($time, "\nTest case 3: Write to full and read back");
    for (i=0; i<fifo_depth; i=i+1)
      write_data(2**i);

    for (i=0; i<fifo_depth; i=i+1)
      read_data();
    
    #50 $finish;
  end
  
  // Generate waveforms
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(0, tb_fifo_sync);
  end

endmodule
