`timescale 1ns/1ps

module bidirectional_buffer_tb;

// Testbench signals
reg dir;

// Drivers for A and B
reg A_drv;
reg B_drv;

// Wires connected to DUT
wire A;
wire B;


// Drive A only when DIR=1
assign A = (dir) ? A_drv : 1'bz;


// Drive B only when DIR=0
assign B = (~dir) ? B_drv : 1'bz;


// Instantiate DUT
bidirectional_buffer uut(

    .A(A),
    .B(B),
    .dir(dir)

);


initial
begin

    // A --> B

    dir   = 1;
    A_drv = 1;
    B_drv = 1'bz;

    #10;


    dir   = 1;
    A_drv = 0;

    #10;


    // B --> A

    dir   = 0;
    B_drv = 1;
    A_drv = 1'bz;

    #10;


    dir   = 0;
    B_drv = 0;

    #10;


    $finish;

end


initial
begin

    $monitor(
    "Time=%0t DIR=%b A=%b B=%b",
    $time,dir,A,B);

end

endmodule