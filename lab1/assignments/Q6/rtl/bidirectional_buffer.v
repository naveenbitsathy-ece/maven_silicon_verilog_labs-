module bidirectional_buffer(
    inout wire A,
    inout wire B,
    input wire dir   // direction control
);

// A → B when dir = 1
assign B = dir ? A : 1'bz;

// B → A when dir = 0
assign A = dir ? 1'bz : B;

endmodule