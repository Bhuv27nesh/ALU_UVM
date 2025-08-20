class alu_test extends uvm_test;
  
  `uvm_component_utils(alu_test)
  alu_environment env1;
  alu_sequence sq1;
  function new(string name = "alu_test", uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env1 = alu_environment::type_id::create("env1",this);
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);      
    sq1 = alu_sequence::type_id::create("sq1",this);
    sq1.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

////////////////////////////////////////////////////////////////////////////////////////////////

class arith_test_single_op extends alu_test;
  `uvm_component_utils(arith_test_single_op)
  
  function new(string name = "arith_test_single_op",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    arithmetic_seq_single_op seq1;
    phase.raise_objection(this);
    seq1 = arithmetic_seq_single_op::type_id::create("seq1");
    seq1.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------

class logical_test_single_op extends alu_test;
  `uvm_component_utils(logical_test_single_op)

  function new(string name = "logical_test_single_op",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    logical_seq_single_op seq2;
    phase.raise_objection(this);
    seq2 = logical_seq_single_op::type_id::create("seq2");
    seq2.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------

class arith_test_two_op extends alu_test;
  `uvm_component_utils(arith_test_two_op)

  function new(string name = "arith_test_two_op",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    arithmetic_seq_two_op seq3;
    phase.raise_objection(this);
    seq3 = arithmetic_seq_two_op::type_id::create("seq3");
    seq3.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------

class logical_test_two_op extends alu_test;
  `uvm_component_utils(logical_test_two_op)

  function new(string name = "logical_test_two_op",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    logical_seq_two_op seq4;
    phase.raise_objection(this);
    seq4 = logical_seq_two_op::type_id::create("seq4");
    seq4.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------

class test_add extends alu_test;
  `uvm_component_utils(test_add)

  function new(string name = "test_add",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    ADD seq5;
    phase.raise_objection(this);
    seq5 = ADD::type_id::create("seq5");
    seq5.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------

class test_sub extends alu_test;
  `uvm_component_utils(test_sub)

  function new(string name = "test_sub",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    SUB seq6;
    phase.raise_objection(this);
    seq6 = SUB::type_id::create("seq6");
    seq6.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_add_cin extends alu_test;
  `uvm_component_utils(test_add_cin)

  function new(string name = "test_add_cin",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    ADD_CIN seq7;
    phase.raise_objection(this);
    seq7 = ADD_CIN::type_id::create("seq7");
    seq7.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_sub_cin extends alu_test;
  `uvm_component_utils(test_sub_cin)

  function new(string name = "test_sub_cin",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    SUB_CIN seq8;
    phase.raise_objection(this);
    seq8 = SUB_CIN::type_id::create("seq8");
    seq8.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_inc_a extends alu_test;
  `uvm_component_utils(test_inc_a)

  function new(string name = "test_inc_a",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    INC_A seq9;
    phase.raise_objection(this);
    seq9 = INC_A::type_id::create("seq9");
    seq9.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_dec_a extends alu_test;
  `uvm_component_utils(test_dec_a)

  function new(string name = "test_dec_a",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    DEC_A seq10;
    phase.raise_objection(this);
    seq10 = DEC_A::type_id::create("seq10");
    seq10.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_inc_b extends alu_test;
  `uvm_component_utils(test_inc_b)

  function new(string name = "test_inc_b",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    INC_B seq11;
    phase.raise_objection(this);
    seq11 = INC_B::type_id::create("seq11");
    seq11.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_dec_b extends alu_test;
  `uvm_component_utils(test_dec_b)

  function new(string name = "test_dec_b",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    DEC_B seq12;
    phase.raise_objection(this);
    seq12 = DEC_B::type_id::create("seq12");
    seq12.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_cmp extends alu_test;
  `uvm_component_utils(test_cmp)

  function new(string name = "test_cmp",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    CMP seq13;
    phase.raise_objection(this);
    seq13 = CMP::type_id::create("seq13");
    seq13.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_rol_a_b extends alu_test;
  `uvm_component_utils(test_rol_a_b)

  function new(string name = "test_rol_a_b",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    ROL_A_B seq14;
    phase.raise_objection(this);
    seq14 = ROL_A_B::type_id::create("seq14");
    seq14.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_ror_a_b extends alu_test;
  `uvm_component_utils(test_ror_a_b)

  function new(string name = "test_ror_a_b",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    ROR_A_B seq15;
    phase.raise_objection(this);
    seq15 = ROR_A_B::type_id::create("seq15");
    seq15.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------


class test_and extends alu_test;
  `uvm_component_utils(test_and)

  function new(string name = "test_and",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    AND seq16;
    phase.raise_objection(this);
    seq16 = AND::type_id::create("seq16");
    seq16.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_nand extends alu_test;
  `uvm_component_utils(test_nand)

  function new(string name = "test_nand",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    NAND seq17;
    phase.raise_objection(this);
    seq17 = NAND::type_id::create("seq17");
    seq17.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_or extends alu_test;
  `uvm_component_utils(test_or)

  function new(string name = "test_or",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    OR seq18;
    phase.raise_objection(this);
    seq18 = OR::type_id::create("seq18");
    seq18.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_nor extends alu_test;
  `uvm_component_utils(test_nor)

  function new(string name = "test_nor",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    NOR seq19;
    phase.raise_objection(this);
    seq19 = NOR::type_id::create("seq19");
    seq19.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_xor extends alu_test;
  `uvm_component_utils(test_xor)

  function new(string name = "test_xor",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    XOR seq20;
    phase.raise_objection(this);
    seq20 = XOR::type_id::create("seq20");
    seq20.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_xnor extends alu_test;
  `uvm_component_utils(test_xnor)

  function new(string name = "test_xnor",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    XNOR seq21;
    phase.raise_objection(this);
    seq21 = XNOR::type_id::create("seq21");
    seq21.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_not_a extends alu_test;
  `uvm_component_utils(test_not_a)

  function new(string name = "test_not_a",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    NOT_A seq22;
    phase.raise_objection(this);
    seq22 = NOT_A::type_id::create("seq22");
    seq22.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_not_b extends alu_test;
  `uvm_component_utils(test_not_b)

  function new(string name = "test_not_b",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    NOT_B seq23;
    phase.raise_objection(this);
    seq23 = NOT_B::type_id::create("seq23");
    seq23.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_shr1_a extends alu_test;
  `uvm_component_utils(test_shr1_a)

  function new(string name = "test_shr1_a",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    SHR1_A seq24;
    phase.raise_objection(this);
    seq24 = SHR1_A::type_id::create("seq24");
    seq24.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_shl1_a extends alu_test;
  `uvm_component_utils(test_shl1_a)

  function new(string name = "test_shl1_a",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    SHL1_A seq25;
    phase.raise_objection(this);
    seq25 = SHL1_A::type_id::create("seq25");
    seq25.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_shr1_b extends alu_test;
  `uvm_component_utils(test_shr1_b)

  function new(string name = "test_shr1_b",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    SHR1_B seq26;
    phase.raise_objection(this);
    seq26 = SHR1_B::type_id::create("seq26");
    seq26.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_shl1_b extends alu_test;
  `uvm_component_utils(test_shl1_b)

  function new(string name = "test_shl1_b",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    SHL1_B seq27;
    phase.raise_objection(this);
    seq27 = SHL1_B::type_id::create("seq27");
    seq27.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_rol_a_b extends alu_test;
  `uvm_component_utils(test_rol_a_b)

  function new(string name = "test_rol_a_b",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    ROL_A_B seq28;
    phase.raise_objection(this);
    seq28 = ROL_A_B::type_id::create("seq28");
    seq28.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------


class test_ror_a_b extends alu_test;
  `uvm_component_utils(test_ror_a_b)

  function new(string name = "test_ror_a_b",uvm_component parent = null);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    ROR_A_B seq29;
    phase.raise_objection(this);
    seq29 = ROR_A_B::type_id::create("seq29");
    seq29.start(env1.agnt1.seqr1);
    phase.drop_objection(this);
  endtask

endclass

//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------


class regression_test extends alu_test;
  `uvm_component_utils(regression_test)
  function new(string name = "regression_test", uvm_component parent);
    super.new(name,parent);
  endfunction

  virtual task run_phase(uvm_phase phase);

    regression_seq seq_reg;
    phase.raise_objection(this);
    seq_reg = regression_seq::type_id::create("seq_reg");
    seq_reg.start(env1.agnt1.seqr1);
       phase.drop_objection(this);
  endtask
endclass

//-------------------------------------------------------------------------------------------------


