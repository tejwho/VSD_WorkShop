`timescale 1ns/1ps

module tb_top;

    reg clk, rst;
    reg sensor_A, sensor_B;
    reg gate_closed, gate_open;

    wire motor_open, motor_close;
    wire road_red, road_yellow, road_green;
    wire warning_light, alarm, fault;

    top_module DUT (
        .clk(clk), .rst(rst),
        .sensor_A(sensor_A), .sensor_B(sensor_B),
        .gate_closed(gate_closed), .gate_open(gate_open),
        .motor_open(motor_open), .motor_close(motor_close),
        .road_red(road_red), .road_yellow(road_yellow),
        .road_green(road_green), .warning_light(warning_light),
        .alarm(alarm), .fault(fault)
    );

    always #5 clk = ~clk;

    task check_state;
        input [2:0] expected;
        input [200*8:1] message;
        begin
            if (DUT.state !== expected) begin
                $display("FAIL: %0s expected=%0d actual=%0d",
                         message, expected, DUT.state);
                $fatal(1);
            end
            else
                $display("PASS: %0s", message);
        end
    endtask

    task reset_dut;
        begin
            @(negedge clk);
            rst = 1;
            sensor_A = 0;
            sensor_B = 0;
            gate_closed = 0;
            gate_open = 1;
            repeat (2) @(negedge clk);
            rst = 0;
            @(negedge clk);
            check_state(3'd0, "Reset enters IDLE");
        end
    endtask

    task start_closing;
        begin
            sensor_A = 1;
            @(negedge clk);
            sensor_A = 0;
            check_state(3'd1, "Train detection enters WARNING");

            wait (DUT.state == 3'd2);
            #1;
            check_state(3'd2, "Warning completes; gate closing starts");
        end
    endtask

    initial begin
        clk = 0;
        rst = 1;
        sensor_A = 0;
        sensor_B = 0;
        gate_closed = 0;
        gate_open = 1;

        // Test 1: normal crossing
        repeat (2) @(negedge clk);
        rst = 0;
        @(negedge clk);
        check_state(3'd0, "Initial reset enters IDLE");

        start_closing();

        @(negedge clk);
        gate_open = 0;
        gate_closed = 1;
        @(posedge clk); #1;
        check_state(3'd3, "Gate closed; train passage starts");

        @(negedge clk);
        sensor_B = 1;
        @(posedge clk); #1;
        check_state(3'd4, "Train passed; gate opening starts");

        @(negedge clk);
        sensor_B = 0;
        gate_closed = 0;
        gate_open = 1;
        @(posedge clk); #1;
        check_state(3'd0, "Gate opened; crossing returns to IDLE");

        // Test 2: closing timeout
        reset_dut();
        start_closing();

        // Leave gate_closed low until timeout occurs.
        wait (fault === 1'b1);
        check_state(3'd5, "Closing timeout enters FAULT");

        if (road_red !== 1'b1 || alarm !== 1'b1)
            $fatal(1, "FAIL: Closing fault outputs are unsafe");
        $display("PASS: Closing fault asserts red and alarm");

        repeat (3) @(negedge clk);
        check_state(3'd5, "Fault remains latched");

        // Test 3: reset clears fault
        reset_dut();
        if (fault !== 1'b0)
            $fatal(1, "FAIL: Reset did not clear fault");
        $display("PASS: Reset clears fault");

        // Test 4: opening timeout
        start_closing();

        @(negedge clk);
        gate_closed = 1;
        gate_open = 0;
        @(posedge clk); #1;
        check_state(3'd3, "Gate closes for opening-timeout test");

        @(negedge clk);
        sensor_B = 1;
        @(posedge clk); #1;
        check_state(3'd4, "Opening-timeout test enters OPEN_GATE");

        @(negedge clk);
        sensor_B = 0;
        gate_closed = 0;
        // Keep gate_open low: timeout should trigger.
        wait (fault === 1'b1);
        check_state(3'd5, "Opening timeout enters FAULT");

        if (road_red !== 1'b1 || alarm !== 1'b1)
            $fatal(1, "FAIL: Opening fault outputs are unsafe");
        $display("PASS: Opening fault asserts red and alarm");

        $display("ALL TESTS COMPLETED");
        $finish;
    end

    initial begin
        $dumpfile("railway_crossing.vcd");
        $dumpvars(0, tb_top);
    end

    initial begin
        #10000;
        $fatal(1, "FAIL: Simulation watchdog timeout");
    end

endmodule
