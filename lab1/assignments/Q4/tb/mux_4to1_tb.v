module mux_4to1_tb();

reg i0, i1, i2, i3;
reg s1, s0;
wire y;

integer i;

// DUT
mux_4to1_using_mux2 DUT(
    .i0(i0), .i1(i1), .i2(i2), .i3(i3),
    .s1(s1), .s0(s0),
    .y(y)
);

// Apply all combinations
initial begin
    for (i = 0; i < 64; i = i + 1) begin
        {i0, i1, i2, i3, s1, s0} = i;
        #10;
    end
end

// Monitor
initial begin
    $monitor("Time=%0t | I=%b%b%b%b S=%b%b | Y=%b",
              $time, i0,i1,i2,i3, s1,s0, y);
end

// Stop simulation
initial begin
    #650;
    $finish;
end

endmodule