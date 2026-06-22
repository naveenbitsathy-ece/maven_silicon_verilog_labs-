module vending_machine(
    input clk,
    input rst,

    input I,
    input J,

    output reg X,   // Product
    output reg Y    // Change Return
);

    parameter S0 = 3'b000; // Rs.0
    parameter S1 = 3'b001; // Rs.1
    parameter S2 = 3'b010; // Rs.2
    parameter S3 = 3'b011; // Rs.3
    parameter S4 = 3'b100; // Rs.4

    reg [2:0] state, next_state;

    //--------------------------------------------------
    // State Register
    //--------------------------------------------------
    always @(posedge clk or posedge rst)
    begin
        if(rst)
            state <= S0;
        else
            state <= next_state;
    end

    //--------------------------------------------------
    // Next State Logic
    //--------------------------------------------------
    always @(*)
    begin
        case(state)

            // Rs.0 collected
            S0:
            begin
                if(I==1 && J==0)
                    next_state = S1; // +1

                else if(I==1 && J==1)
                    next_state = S2; // +2

                else
                    next_state = S0;
            end

            // Rs.1 collected
            S1:
            begin
                if(I==1 && J==0)
                    next_state = S2; // 1+1=2

                else if(I==1 && J==1)
                    next_state = S3; // 1+2=3

                else
                    next_state = S1;
            end

            // Rs.2 collected
            S2:
            begin
                if(I==1 && J==0)
                    next_state = S3; // 2+1=3

                else if(I==1 && J==1)
                    next_state = S4; // 2+2=4

                else
                    next_state = S2;
            end

            // Product Dispensed
            S3:
                next_state = S0;

            // Product + Change
            S4:
                next_state = S0;

            default:
                next_state = S0;

        endcase
    end

    //--------------------------------------------------
    // Output Logic (Moore)
    //--------------------------------------------------
    always @(*)
    begin
        case(state)

            S0:
            begin
                X = 0;
                Y = 0;
            end

            S1:
            begin
                X = 0;
                Y = 0;
            end

            S2:
            begin
                X = 0;
                Y = 0;
            end

            S3:
            begin
                X = 1;   // Product
                Y = 0;
            end

            S4:
            begin
                X = 1;   // Product
                Y = 1;   // Return Re.1
            end

            default:
            begin
                X = 0;
                Y = 0;
            end

        endcase
    end

endmodule