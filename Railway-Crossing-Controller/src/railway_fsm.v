module railway_fsm (
    input  wire       clk,
    input  wire       rst,
    input  wire       sensor_A,
    input  wire       sensor_B,
    input  wire       gate_closed,
    input  wire       gate_open,
    input  wire       warning_done,
    input  wire       timeout,
    output reg  [2:0] state
);

    localparam IDLE          = 3'd0;
    localparam WARNING       = 3'd1;
    localparam CLOSE_GATE    = 3'd2;
    localparam TRAIN_PASSING = 3'd3;
    localparam OPEN_GATE     = 3'd4;
    localparam FAULT         = 3'd5;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (sensor_A)
                        state <= WARNING;
                end

                WARNING: begin
                    if (warning_done)
                        state <= CLOSE_GATE;
                end

                CLOSE_GATE: begin
                    if (gate_closed)
                        state <= TRAIN_PASSING;
                    else if (timeout)
                        state <= FAULT;
                end

                TRAIN_PASSING: begin
                    if (sensor_B)
                        state <= OPEN_GATE;
                end

                OPEN_GATE: begin
                    if (gate_open)
                        state <= IDLE;
                    else if (timeout)
                        state <= FAULT;
                end

                FAULT: begin
                    state <= FAULT;
                end

                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
