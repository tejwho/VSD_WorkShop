module top_module (
    input  wire clk,
    input  wire rst,

    input  wire sensor_A,
    input  wire sensor_B,

    input  wire gate_closed,
    input  wire gate_open,

    output wire motor_open,
    output wire motor_close,

    output wire road_red,
    output wire road_yellow,
    output wire road_green,

    output wire warning_light,
    output wire alarm,
    output wire fault
);

    wire [2:0] state;
    wire warning_done;
    wire timeout;

    railway_fsm FSM (
        .clk          (clk),
        .rst          (rst),
        .sensor_A     (sensor_A),
        .sensor_B     (sensor_B),
        .gate_closed  (gate_closed),
        .gate_open    (gate_open),
        .warning_done (warning_done),
        .timeout      (timeout),
        .state        (state)
    );

    timer #(
        .WARNING_TIME (10),
        .TIMEOUT_TIME (15)
    ) TIMER (
        .clk          (clk),
        .rst          (rst),
        .state        (state),
        .warning_done (warning_done),
        .timeout      (timeout)
    );

    signal_controller SIGNALS (
        .state         (state),
        .motor_open    (motor_open),
        .motor_close   (motor_close),
        .road_red      (road_red),
        .road_yellow   (road_yellow),
        .road_green    (road_green),
        .warning_light (warning_light),
        .alarm         (alarm),
        .fault         (fault)
    );

endmodule
