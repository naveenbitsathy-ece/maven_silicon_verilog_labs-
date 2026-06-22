module decoder_2to4(
    input s1,      // MSB select line
    input s0,      // LSB select line

    output d0,     // Active when s1s0 = 00
    output d1,     // Active when s1s0 = 01
    output d2,     // Active when s1s0 = 10
    output d3      // Active when s1s0 = 11
);
wire y0,y1,y2,y3;

// When s1=0 and s0=0, d0 becomes 1
assign d0 = ~s1 & ~s0;

// When s1=0 and s0=1, d1 becomes 1
assign d1 = ~s1 & s0;

// When s1=1 and s0=0, d2 becomes 1
assign d2 = s1 & ~s0;

// When s1=1 and s0=1, d3 becomes 1
assign d3 = s1 & s0;

endmodule