module timer #(
    parameter WARNING_TIME = 10,
    parameter TIMEOUT_TIME = 15
) (
    input  wire       clk,
    input  wire       rst,
    input  wire [2:0] state,
    output reg        warning_done,
    output reg        timeout
);

    localparam IDLE           = 3'd0;
    localparam WARNING        = 3'd1;
    localparam CLOSE_GATE     = 3'd2;
    localparam OPEN_GATE      = 3'd4;

    reg [4:0] counter;
    reg [2:0] previous_state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter        <= 5'd0;
            previous_state <= IDLE;
        end else begin
            if (state != previous_state) begin
                counter        <= 5'd0;
                previous_state <= state;
            end else begin
                case (state)
                    WARNING: begin
                        if (counter < WARNING_TIME)
                            counter <= counter + 1'b1;
                    end

                    CLOSE_GATE, OPEN_GATE: begin
                        if (counter < TIMEOUT_TIME)
                            counter <= counter + 1'b1;
                    end

                    default: begin
                        counter <= 5'd0;
                    end
                endcase
            end
        end
    end

    always @(*) begin
        warning_done = 1'b0;
        timeout      = 1'b0;

        if ((state == WARNING) &&
            (counter >= WARNING_TIME))
            warning_done = 1'b1;

        if (((state == CLOSE_GATE) ||
             (state == OPEN_GATE)) &&
            (counter >= TIMEOUT_TIME))
            timeout = 1'b1;
    end

endmodule
