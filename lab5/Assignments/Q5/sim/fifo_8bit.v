module fifo_8bit(

    input clk,
    input reset_n,

    input read_n,
    input write_n,

    input  [7:0] data_in,

    output reg [7:0] data_out,
    output full,
    output empty

);

    // FIFO Memory (16 x 8)
    reg [7:0] fifo [15:0];

    // Pointers
    reg [3:0] wr_ptr;
    reg [3:0] rd_ptr;

    // Count (0 to 16)
    reg [4:0] count;

    integer i;

    //--------------------------------------------------
    // FIFO Logic
    //--------------------------------------------------
    always @(posedge clk or negedge reset_n)
    begin

        if(!reset_n)
        begin

            wr_ptr   <= 4'd0;
            rd_ptr   <= 4'd0;
            count    <= 5'd0;
            data_out <= 8'd0;


            for(i=0;i<16;i=i+1)
                fifo[i] <= 8'd0;

        end

        else
        begin

            //------------------------------------------------
            // WRITE ONLY
            //------------------------------------------------
            if(!write_n && read_n && !full)
            begin

                fifo[wr_ptr] <= data_in;

                wr_ptr <= wr_ptr + 1'b1;

                count <= count + 1'b1;

            end

            //------------------------------------------------
            // READ ONLY
            //------------------------------------------------
            else if(write_n && !read_n && !empty)
            begin

                data_out <= fifo[rd_ptr];

                rd_ptr <= rd_ptr + 1'b1;

                count <= count - 1'b1;

            end

            //------------------------------------------------
            // READ + WRITE SIMULTANEOUSLY
            //------------------------------------------------
            else if(!write_n && !read_n &&
                    !full && !empty)
            begin

                fifo[wr_ptr] <= data_in;

                data_out <= fifo[rd_ptr];

                wr_ptr <= wr_ptr + 1'b1;

                rd_ptr <= rd_ptr + 1'b1;

                // Count unchanged

            end

        end

    end

    //--------------------------------------------------
    // Status Flags
    //--------------------------------------------------

    assign full  = (count == 16);

    assign empty = (count == 0);

endmodule