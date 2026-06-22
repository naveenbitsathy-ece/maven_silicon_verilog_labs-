module Mux_Decoder4to1(

    input I0,      // Input 0
    input I1,      // Input 1
    input I2,      // Input 2
    input I3,      // Input 3

    input S1,      // Select bit 1
    input S0,      // Select bit 0

    output Y       // MUX output
);

// Wires to carry decoder outputs
wire d0;
wire d1;
wire d2;
wire d3;


// Instantiate decoder
// Decoder generates enable signals
decoder_2to4 D1(
    .s1(S1),
    .s0(S0),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
);


// Tri-state Buffer 0
// If d0=1, pass I0 to Y
// Otherwise output High Impedance (Z)
assign Y = d0 ? I0 : 1'bz;


// Tri-state Buffer 1
// If d1=1, pass I1 to Y
// Otherwise output Z
assign Y = d1 ? I1 : 1'bz;


// Tri-state Buffer 2
// If d2=1, pass I2 to Y
// Otherwise output Z
assign Y = d2 ? I2 : 1'bz;


// Tri-state Buffer 3
// If d3=1, pass I3 to Y
// Otherwise output Z
assign Y = d3 ? I3 : 1'bz;

endmodule