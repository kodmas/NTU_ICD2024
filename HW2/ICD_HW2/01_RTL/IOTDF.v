`timescale 1ns / 10ps

module IOTDF(
    input clk,
    input rst,
    input in_en,
    input [7:0] iot_in,
    input [2:0] fn_sel,
    output reg busy,
    output reg valid,
    output reg [127:0] iot_out
);

    reg [127:0] data_buffer; // Buffer to store incoming data
    reg [7:0] x [15:0]; // Data points for FIR Filter
    reg [127:0] fir_output; // Output from FIR filter calculations
    integer i;
    reg [4:0] received_segments; // Counter for the segments received

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset logic for entire module
            data_buffer <= 0;
            iot_out <= 0;
            valid <= 0;
            busy <= 0;
            received_segments <= 0;
            fir_output <= 0;
            for (i = 0; i < 16; i = i + 1) begin
                x[i] <= 0;
            end
        end else if (in_en) begin
            // Start receiving a new data set
            data_buffer <= {data_buffer[119:0], iot_in};
            received_segments <= received_segments + 1;

            // Check if all segments are loaded
            if (received_segments == 14) begin
                busy <= 1; // Indicate the module is busy processing the data
            end
        end

        if (received_segments == 16) begin
            // Process the data once all segments have been received
            if (fn_sel == 3'b001) begin // Gray2Bin conversion
                // Perform Gray to Binary conversion
                iot_out[127] = data_buffer[127]; // MSB is the same
                for (i = 126; i >= 0; i = i - 1) begin
                    iot_out[i] = iot_out[i + 1] ^ data_buffer[i];
                end
            end else if (fn_sel == 3'b010) begin // FIR filter
                // Parse the entire 128-bit data into 16 segments
                for (i = 0; i < 16; i = i + 1) begin
                    // x[i] <= data_buffer[8*i +: 8];
                    x[i] = data_buffer[8 * (15 - i) +: 8];
                end
                // FIR computation for each 8-bit chunk
                for (i = 0; i < 16; i = i + 1) begin
                    fir_output[8*(15-i) +: 8] = round(0.3125 * x[i] + 0.5625 * (i > 0 ? x[i-1] : 0) + 0.125 * (i > 1 ? x[i-2] : 0));
                end
                iot_out = fir_output;
            end

            // Mark output as valid and reset internal state for next data set
            valid <= 1;
            received_segments <= 0; // Reset segment count for next data set
            data_buffer <= 0; // Clear the buffer
        end
        
        if (valid) begin
            // Clear valid after output has been acknowledged
            valid <= 0;
            iot_out <= 0; // Prepare for the next output
            busy <= 0; // Indicate module is ready for new data
        end
    end

    // Helper function to perform rounding
    function [7:0] round(input real value);
    begin
        if (value - $floor(value) >= 0.5)
            round = $ceil(value);
        else
            round = $floor(value);
    end
    endfunction
endmodule
