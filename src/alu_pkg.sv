`include "uvm_macros.svh"
package alu_pkg;
  import uvm_pkg::*;
  `include "alu_seq_item.sv"
  `include "alu_sequence.sv"
  `include "alu_sequencer.sv"
  `include "alu_driver.sv"
  `include "alu_monitor.sv"
  `include "alu_agent.sv"
  `include "alu_scoreboard.sv"
  `include "coverage.sv"
  `include "alu_environment.sv"
  `include "alu_test.sv"
endpackage
