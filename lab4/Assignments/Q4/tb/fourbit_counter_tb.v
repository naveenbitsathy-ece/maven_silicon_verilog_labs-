`timescale 1ns/1ps

module fourbit_counter_tb();

reg clk;
reg reset;
reg load;

reg [3:0] data_in;

wire [3:0] count;


// DUT
fourbit_counter DUT(

    .clk(clk),
    .reset(reset),
    .load(load),

    .data_in(data_in),

    .count(count)

);


// Clock Generation
initial
    clk = 0;

always #5 clk = ~clk;


// Stimulus
initial
begin

    // Initialize
    reset   = 1;
    load    = 0;
    data_in = 4'b0000;

    #10;

    // Release reset
    reset = 0;

    // Counter starts counting
    #40;

    // Load value 1010
    load = 1;
    data_in = 4'b1010;

    #10;

    // Continue counting
    load = 0;

    #50;

    // Reset again
    reset = 1;

    #10;

    reset = 0;

    #30;

    $finish;

end


// Monitor
initial
begin

    $monitor(
    "Time=%0t reset=%b load=%b data=%b count=%b",
    $time, reset, load, data_in, count);

end

endmodule