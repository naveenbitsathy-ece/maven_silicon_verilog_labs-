module fourbit_counter(

    input clk,                 // Clock
    input reset,               // Synchronous reset
    input load,                // Load control

    input [3:0] data_in,       // Parallel input

    output reg [3:0] count     // Counter output

);

always @(posedge clk)
begin

    // Reset has highest priority
    if(reset)
        count <= 4'b0000;

    // Load operation
    else if(load)
        count <= data_in;

    // Count operation
    else
        count <= count + 1'b1;

end

endmodule