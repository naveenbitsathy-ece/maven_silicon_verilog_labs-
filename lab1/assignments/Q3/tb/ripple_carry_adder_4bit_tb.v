module ripple_carry_adder_4bit_tb();

reg  [3:0] a, b;
reg  cin;
wire [3:0] sum;
wire cout;

integer i;

// DUT Instantiation
ripple_carry_adder_4bit DUT (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

// Apply all combinations
initial begin
    for (i = 0; i < 512; i = i + 1) begin
        {a, b, cin} = i;   // 4 + 4 + 1 = 9 bits
        #10;
    end
end

// Monitor outputs
initial begin
    $monitor("Time=%0t | a=%b b=%b cin=%b | sum=%b cout=%b",
              $time, a, b, cin, sum, cout);
end

// Stop simulation
initial begin
    #5200;
    $finish;
end

endmodule