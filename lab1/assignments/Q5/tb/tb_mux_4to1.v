`timescale 1ns/1ps

module tb_mux4to1;

// Inputs to DUT
reg I0;
reg I1;
reg I2;
reg I3;

reg S1;
reg S0;

// Output from DUT
wire Y;


// Instantiate DUT
Mux_Decoder4to1 uut(
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .S1(S1),
    .S0(S0),
    .Y(Y)
);


initial
begin

    // Fixed input values
    I0 = 0;
    I1 = 1;
    I2 = 0;
    I3 = 1;

    // Select I0
    S1 = 0;
    S0 = 0;
    #10;

    // Select I1
    S1 = 0;
    S0 = 1;
    #10;

    // Select I2
    S1 = 1;
    S0 = 0;
    #10;

    // Select I3
    S1 = 1;
    S0 = 1;
    #10;

    $finish;

end


initial
begin
    $monitor(
    "Time=%0t S1=%b S0=%b Y=%b",
    $time,S1,S0,Y);
end

endmodule