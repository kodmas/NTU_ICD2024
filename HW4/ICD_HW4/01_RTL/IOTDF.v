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
            iot_out = 0;
            valid <= 0;
            busy <= 0;
            received_segments <= 0;
            fir_output = 0;
            for (i = 0; i < 16; i = i + 1) begin
                x[i] = 0;
            end
        end else begin
            if (in_en && received_segments < 16) begin
                // Start receiving a new data set
                data_buffer <= {data_buffer[119:0], iot_in};
                received_segments <= received_segments + 1;

                // Indicate the module is busy processing the data when segments are enough
                if (received_segments == 14) begin
                    busy <= 1;
                end
            end
            
            if (received_segments == 16) begin
                // Process the data once all segments have been received
                if (fn_sel == 3'b001) begin // Gray2Bin conversion
                    iot_out[127] = data_buffer[127]; // MSB is the same
                    for (i = 126; i >= 0; i = i - 1) begin
                        iot_out[i] = iot_out[i + 1] ^ data_buffer[i];
                    end
                end else if (fn_sel == 3'b010) begin // FIR filter
                    for (i = 0; i < 16; i = i + 1) begin
                        x[i] = data_buffer[8 * (15 - i) +: 8];
                    end
                    for (i = 0; i < 16; i = i + 1) begin
                        fir_output[8*(15-i) +: 8] = round(
                            5 * x[i] +
                            9 * (i > 0 ? x[i-1] : 0) +
                            2 * (i > 1 ? x[i-2] : 0)
                        );
                    end
                    iot_out = fir_output;
                end
                valid <= 1;
                received_segments <= 0;
                data_buffer <= 0;
            end
            
            if (valid) begin
                // Clear valid after output has been acknowledged
                valid <= 0;
                iot_out = 0;
                busy <= 0; // Indicate module is ready for new data
            end
        end
    end

    // Helper function to perform rounding
    function [7:0] round(input [19:0] value);
        begin
            // Check the 4 LSBs to determine rounding
            if (value[3:0] >= 4'd8) begin
                round = (value[19:4] + 1); // Add one to the integer part if fraction is >= 0.5
            end else begin
                round = value[19:4]; // Take the integer part if fraction is < 0.5
            end
        end
    endfunction
endmodule
