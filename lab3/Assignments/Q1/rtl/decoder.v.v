module decoder_3x8(

    input A,
    input B,
    input C,

    output Y0,
    output Y1,
    output Y2,
    output Y3,
    output Y4,
    output Y5,
    output Y6,
    output Y7

);

// Output Y0 active for 000
assign Y0 = ~A & ~B & ~C;

// Output Y1 active for 001
assign Y1 = ~A & ~B & C;

// Output Y2 active for 010
assign Y2 = ~A & B & ~C;

// Output Y3 active for 011
assign Y3 = ~A & B & C;

// Output Y4 active for 100
assign Y4 = A & ~B & ~C;

// Output Y5 active for 101
assign Y5 = A & ~B & C;

// Output Y6 active for 110
assign Y6 = A & B & ~C;

// Output Y7 active for 111
assign Y7 = A & B & C;

endmodule