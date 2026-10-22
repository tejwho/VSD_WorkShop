module signal_controller (
    input  wire [2:0] state,
    output reg        motor_open,
    output reg        motor_close,
    output reg        road_red,
    output reg        road_yellow,
    output reg        road_green,
    output reg        warning_light,
    output reg        alarm,
    output reg        fault
);

    localparam IDLE           = 3'd0;
    localparam WARNING        = 3'd1;
    localparam CLOSE_GATE     = 3'd2;
    localparam TRAIN_PASSING  = 3'd3;
    localparam OPEN_GATE      = 3'd4;
    localparam FAULT          = 3'd5;

    always @(*) begin
        motor_open    = 1'b0;
        motor_close   = 1'b0;
        road_red      = 1'b0;
        road_yellow   = 1'b0;
        road_green    = 1'b0;
        warning_light = 1'b0;
        alarm         = 1'b0;
        fault         = 1'b0;

        case (state)
            IDLE: begin
                road_green = 1'b1;
            end

            WARNING: begin
                road_yellow   = 1'b1;
                warning_light = 1'b1;
                alarm         = 1'b1;
            end

            CLOSE_GATE: begin
                motor_close   = 1'b1;
                road_red      = 1'b1;
                warning_light = 1'b1;
                alarm         = 1'b1;
            end

            TRAIN_PASSING: begin
                road_red      = 1'b1;
                warning_light = 1'b1;
                alarm         = 1'b1;
            end

            OPEN_GATE: begin
                motor_open = 1'b1;
                road_red   = 1'b1;
            end

            FAULT: begin
                road_red = 1'b1;
                fault    = 1'b1;
                alarm    = 1'b1;
            end

            default: begin
                road_red = 1'b1;
            end
        endcase
    end

endmodule
