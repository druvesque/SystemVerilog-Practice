// NOTES
// vlog -work work file.sv
// vsim -novopt work.tb
// vlog -help
// vsim -help
// 
// GUI
// TCL
// CORE
//
//
// Parallel Blocks in Verilog 
//
// - fork...join/join_any/join_none
// - always (always_ff, always_latch, always_comb)
// - multiple initial blocks
// - multiple parallel blocks
// - module instantiation
// - gate instantiation
// - primitive instances
// - specify blocks
// - assign statements
//
// sequence abc
//     @(posedge clk) (req ##1 ack ##1 !req)
// endsequence
//
// property xyz
//     @(posedge clk) (req ##1 ack ##1 !req)
// endproperty
//
// property xyz1
//     @(posedge clk) |-> (req ##1 ack ##1 !req)
// endproperty


