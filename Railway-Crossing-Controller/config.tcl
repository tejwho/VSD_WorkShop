set ::env(DESIGN_NAME) top_module

set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]

set ::env(CLOCK_PORT) clk
set ::env(CLOCK_PERIOD) 10

set ::env(FP_SIZING) relative
set ::env(FP_CORE_UTIL) 30
set ::env(PL_TARGET_DENSITY) 0.40

set ::env(SYNTH_MAX_FANOUT) 8


# Load the installed Sky130 HD library configuration
source $::env(PDK_ROOT)/$::env(PDK)/libs.tech/openlane/$::env(STD_CELL_LIBRARY)/config.tcl
