`timescale 1ns/1ps

module tb_decoder_3x8;

// Inputs
reg A;
reg B;
reg C;

// Outputs
wire Y0;
wire Y1;
wire Y2;
wire Y3;
wire Y4;
wire Y5;
wire Y6;
wire Y7;

// DUT Instantiation
decoder_3x8 DUT(

    .A(A),
    .B(B),
    .C(C),

    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3),
    .Y4(Y4),
    .Y5(Y5),
    .Y6(Y6),
    .Y7(Y7)

);

initial
begin

    // 000
    A=0; B=0; C=0;
    #10;

    // 001
    A=0; B=0; C=1;
    #10;

    // 010
    A=0; B=1; C=0;
    #10;

    // 011
    A=0; B=1; C=1;
    #10;

    // 100
    A=1; B=0; C=0;
    #10;

    // 101
    A=1; B=0; C=1;
    #10;

    // 110
    A=1; B=1; C=0;
    #10;

    // 111
    A=1; B=1; C=1;
    #10;

    $finish;

end

initial
begin

    $monitor(
    "Time=%0t A=%b B=%b C=%b | Y0=%b Y1=%b Y2=%b Y3=%b Y4=%b Y5=%b Y6=%b Y7=%b",
    $time,A,B,C,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);

end

endmodule