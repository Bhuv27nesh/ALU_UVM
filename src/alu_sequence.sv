`include "alu_defines.sv"

class alu_sequence extends uvm_sequence#(seq_item);
  
  `uvm_object_utils(alu_sequence)

  int single_op_arithmetic[] = {4,5,6,7};
  int single_op_logical[] = {6,7,8,9,10,11};

  seq_item req;

  function new(string name = "alu_sequence");
    super.new(name);
  endfunction

    virtual task body();
    req = seq_item::type_id::create("req");
    repeat(`num_txns) begin
      start_item(req);
      assert(req.randomize());
      `uvm_info(get_type_name(),$sformatf("| SEQUENCE GENERATED | MODE = %0b | INP_VALID = %2b | CMD = %4b | OPA = %3d | OPB = %3d | CIN = %0d ",req.mode,req.inp_valid,req.CMD, req.OPA,req.OPB,req.Cin),UVM_MEDIUM);
      $display("");
      finish_item(req);
      //get_response(req);
    end

  endtask
endclass

////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

class arithmetic_seq_single_op extends uvm_sequence#(seq_item);
  `uvm_object_utils(arithmetic_seq_single_op)
  
  function new(string name = " arithmetic_seq_single_op");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD inside{[4:7]};req.inp_valid inside {1,2,3};})
    //`uvm_info(get_type_name(),$sformatf("| SEQUENCE GENERATED | MODE = %0b | INP_VALID = %2b | CMD = %4b | OPA = %3d | OPB = %3d | CIN = %0d ",req.mode,req.inp_valid,req.CMD, req.OPA,req.OPB,req.Cin),UVM_MEDIUM);
     //$display("");
     // get_response(req);
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class logical_seq_single_op extends uvm_sequence#(seq_item);
  `uvm_object_utils(logical_seq_single_op)

  function new(string name = "logical_seq_single_op");
    super.new(name);
  endfunction

  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD inside{[6:11]};req.inp_valid inside {1,2,3};})
    //`uvm_info(get_type_name(),$sformatf("| SEQUENCE GENERATED | MODE = %0b | INP_VALID = %2b | CMD = %4b | OPA = %3d | OPB = %3d | CIN = %0d ",req.mode,req.inp_valid,req.CMD, req.OPA,req.OPB,req.Cin),UVM_MEDIUM);
    //$display("");
      //get_response(req);
    end
  endtask
endclass

//--------------------------------------------------------------------------------------------

class arithmetic_seq_two_op extends uvm_sequence#(seq_item);
  `uvm_object_utils(arithmetic_seq_two_op)

  function new(string name = " arithmetic_seq_two_op");
    super.new(name);
  endfunction

  task body();
    repeat(`num_txns) begin
      `uvm_do_with(req,{req.mode == 1;req.CMD inside{[0:3],[8:10]}; req.inp_valid inside {1,2,3};OPA dist {0 := 2, 255 :=2};OPB dist {0:=2,255:=2};})
    //`uvm_info(get_type_name(),$sformatf("| SEQUENCE GENERATED | MODE = %0b | INP_VALID = %2b | CMD = %4b | OPA = %3d | OPB = %3d | CIN = %0d ",req.mode,req.inp_valid,req.CMD, req.OPA,req.OPB,req.Cin),UVM_MEDIUM);
    //$display("");
      //get_response(req);
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class logical_seq_two_op extends uvm_sequence#(seq_item);
    `uvm_object_utils(logical_seq_two_op)

    function new(string name = " logical_seq_two_op");
      super.new(name);
    endfunction

    task body();
      repeat(`num_txns) begin
      `uvm_do_with(req,{req.mode == 0; req.CMD inside{[0:5],12,13};req.inp_valid inside {1,2,3};})
      //`uvm_info(get_type_name(),$sformatf("| SEQUENCE GENERATED | MODE = %0b | INP_VALID = %2b | CMD = %4b | OPA = %3d | OPB = %3d | CIN = %0d ",req.mode,req.inp_valid,req.CMD, req.OPA,req.OPB,req.Cin),UVM_MEDIUM);
      //$display("");
        //get_response(req);
      end
    endtask

endclass

//--------------------------------------------------------------------------------------------


class ADD extends uvm_sequence#(seq_item);
  `uvm_object_utils(ADD)
  
  function new(string name = "ADD");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 0; req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class SUB extends uvm_sequence#(seq_item);
  `uvm_object_utils(SUB)
  
  function new(string name = "SUB");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 1; req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class ADD_CIN extends uvm_sequence#(seq_item);
  `uvm_object_utils(ADD_CIN)
  
  function new(string name = "ADD_CIN");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 2;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class SUB_CIN extends uvm_sequence#(seq_item);
  `uvm_object_utils(SUB_CIN)
  
  function new(string name = "SUB_CIN");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 3;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class INC_A extends uvm_sequence#(seq_item);
  `uvm_object_utils(INC_A)
  
  function new(string name = "INC_A");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 4;req.inp_valid == 2'b01;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class DEC_A extends uvm_sequence#(seq_item);
  `uvm_object_utils(DEC_A)
  
  function new(string name = "DEC_A");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 5;req.inp_valid == 2'b01;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class INC_B extends uvm_sequence#(seq_item);
  `uvm_object_utils(INC_B)
  
  function new(string name = "INC_B");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 6;req.inp_valid == 2'b10;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class DEC_B extends uvm_sequence#(seq_item);
  `uvm_object_utils(DEC_B)
  
  function new(string name = "DEC_B");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 7;req.inp_valid == 2'b10;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class CMP extends uvm_sequence#(seq_item);
  `uvm_object_utils(CMP)
  
  function new(string name = "CMP");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 8;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class INC_MUL extends uvm_sequence#(seq_item);
  `uvm_object_utils(INC_MUL)
  
  function new(string name = "INC_MUL");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 9;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class SH_MUL extends uvm_sequence#(seq_item);
  `uvm_object_utils(SH_MUL)
  
  function new(string name = "SH_MUL");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 1; req.CMD == 10;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------


class AND extends uvm_sequence#(seq_item);
  `uvm_object_utils(AND)
  
  function new(string name = "AND");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 0;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class NAND extends uvm_sequence#(seq_item);
  `uvm_object_utils(NAND)
  
  function new(string name = "NAND");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 1;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class OR extends uvm_sequence#(seq_item);
  `uvm_object_utils(OR)
  
  function new(string name = "OR");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 2;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class NOR extends uvm_sequence#(seq_item);
  `uvm_object_utils(NOR)
  
  function new(string name = "NOR");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 3;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class XOR extends uvm_sequence#(seq_item);
  `uvm_object_utils(XOR)
  
  function new(string name = "XOR");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 4;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class XNOR extends uvm_sequence#(seq_item);
  `uvm_object_utils(XNOR)
  
  function new(string name = "XNOR");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 5;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class NOT_A extends uvm_sequence#(seq_item);
  `uvm_object_utils(NOT_A)
  
  function new(string name = "NOT_A");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 6;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class NOT_B extends uvm_sequence#(seq_item);
  `uvm_object_utils(NOT_B)
  
  function new(string name = "NOT_B");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 7;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class SHR1_A extends uvm_sequence#(seq_item);
  `uvm_object_utils(SHR1_A)
  
  function new(string name = "SHR1_A");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 8;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class SHL1_A extends uvm_sequence#(seq_item);
  `uvm_object_utils(SHL1_A)
  
  function new(string name = "SHL1_A");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 9;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class SHR1_B extends uvm_sequence#(seq_item);
  `uvm_object_utils(SHR1_B)
  
  function new(string name = "SHR1_B");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 10;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class SHL1_B extends uvm_sequence#(seq_item);
  `uvm_object_utils(SHL1_B)
  
  function new(string name = "SHL1_B");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 11;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class ROL_A_B extends uvm_sequence#(seq_item);
  `uvm_object_utils(ROL_A_B)
  
  function new(string name = "ROL_A_B");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 12;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

class ROR_A_B extends uvm_sequence#(seq_item);
  `uvm_object_utils(ROR_A_B)
  
  function new(string name = "ROR_A_B");
    super.new(name);
  endfunction
  
  task body();
    repeat(`num_txns) begin
    `uvm_do_with(req,{req.mode == 0; req.CMD == 13;req.inp_valid == 2'b11;})
    end
  endtask

endclass

//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------

class regression_seq extends uvm_sequence#(seq_item);
  `uvm_object_utils(regression_seq)
  	alu_sequence 			seq;
  	arithmetic_seq_single_op 	seq1;
  	logical_seq_single_op 		seq2;
  	arithmetic_seq_two_op 		seq3;
  	logical_seq_two_op 		seq4;
	//ARITHMETIC
	ADD				seq5;
	ADD_CIN				seq6;
	SUB				seq7;
	SUB_CIN				seq8;
	INC_A				seq9;
	DEC_A				seq10;
	INC_B				seq11;
	DEC_B				seq12;
	CMP				seq13;
	INC_MUL				seq14;
	SH_MUL				seq15;
	//LOGICAL
	AND				seq16;
	NAND				seq17;
	OR				seq18;
	NOR				seq19;
	XOR				seq20;
	XNOR				seq21;
	NOT_A				seq22;
	NOT_B				seq23;
	SHR1_A				seq24;
	SHL1_A				seq25;
	SHR1_B				seq26;
	SHL1_B				seq27;
	ROL_A_B				seq28;
	ROR_A_B				seq29;


  function new(string name = "regression_test");
    super.new(name);
    req = new();
  endfunction

  virtual task body();
    `uvm_do(seq)

    `uvm_do(seq1)

    `uvm_do(seq2)
    
    `uvm_do(seq3)

    `uvm_do(seq4)

    `uvm_do(seq5)

    `uvm_do(seq6)

    `uvm_do(seq7)

    `uvm_do(seq8)
    
    `uvm_do(seq9)

    `uvm_do(seq10)

    `uvm_do(seq11)

    `uvm_do(seq12)

    `uvm_do(seq13)

    `uvm_do(seq14)
    
    `uvm_do(seq15)

    `uvm_do(seq16)

    `uvm_do(seq17)

    `uvm_do(seq18)

    `uvm_do(seq19)

    `uvm_do(seq20)
    
    `uvm_do(seq21)

    `uvm_do(seq22)

    `uvm_do(seq23)

    `uvm_do(seq24)

    `uvm_do(seq25)

    `uvm_do(seq26)
    
    `uvm_do(seq27)

    `uvm_do(seq28)

    `uvm_do(seq29)

  endtask
    
endclass
