`timescale 1ns/1ps

module up_down_counter_tb();

reg clk;
reg rst;
reg load;
reg logic;
reg [3:0] data_in;

wire [3:0] data_out;


// DUT
up_down_counter DUT(

    .clk(clk),
    .rst(rst),
    .logic(logic),
    .load(load),
    .data_in(data_in),
    .data_out(data_out)

);


// Clock Generation
initial
    clk = 0;

always #5 clk = ~clk;


// Stimulus
initial
begin

    // Initialize
    rst   = 1;
    load    = 0;
    data_in = 4'b0000;
    logic = 1;
      #10;

    // Release reset
    rst = 0;

    // Counter starts counting
    #40;

    // Load value 1010
    load = 1;
    data_in = 4'b1010;
     
    #10;

    // Continue counting
    load = 0;
logic = 0;
    #50;

    // Reset again
    rst = 1;

    #10;

    rst = 0;

    #30;

    $finish;

end


// Monitor
initial
begin

    $monitor(
    "Time=%0t logic=%b reset=%b load=%b data=%b count=%b",
    $time, logic , rst, load, data_in, data_out);

end

endmodule