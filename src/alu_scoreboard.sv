`include "alu_defines.sv"

class alu_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(alu_scoreboard)
  uvm_analysis_imp#(seq_item,alu_scoreboard)analysis_imp;
  int match;
  int mismatch;
  seq_item scb_queue[$];
  seq_item scb_item;
  seq_item ref_pkt;
  virtual alu_intf ref_vif;
  function new(string name = "scb",uvm_component parent = null);
    super.new(name,parent);
    analysis_imp = new("analysis_imp_scb",this);
    scb_item = new();
    ref_pkt = new();
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual alu_intf)::get(this,"","alu_intf",ref_vif))
      `uvm_error(get_type_name(),"Config Db not Set")
  endfunction
 
  task alu_operation(seq_item ref_pkt);
    if(ref_vif.ref_cb.RST) begin 	//RESET
           ref_pkt.RES = {9{1'bz}};
           ref_pkt.OFLOW = 1'bz;
           ref_pkt.COUT = 1'bz;
           ref_pkt.G = 1'bz;
           ref_pkt.L = 1'bz;
           ref_pkt.E = 1'bz;
           ref_pkt.ERR = 1'bz;
   end 

   else if(ref_vif.ref_cb.CE) begin

          //assigning default values
          ref_pkt.RES = {9{1'bz}};
          ref_pkt.OFLOW = 1'bz;
          ref_pkt.COUT = 1'bz;
          ref_pkt.G = 1'bz;
          ref_pkt.L = 1'bz;
          ref_pkt.E = 1'bz;
          ref_pkt.ERR = 1'bz;

          if(ref_pkt.mode == 1) begin			//MODE=1 ARITHMETIC
              case(ref_pkt.inp_valid)
                2'b00 : begin
                  ref_pkt.RES = 0;
                  ref_pkt.ERR = 1;
                end
                2'b01 : begin
                  case(ref_pkt.CMD)
                    4'b0100 : begin
                      ref_pkt.RES = ref_pkt.OPA + 1;
                      ref_pkt.COUT = ref_pkt.RES[`DATA_WIDTH];
                    end
                    4'b0101 : begin
                      ref_pkt.RES = ref_pkt.OPA - 1;
                      ref_pkt.OFLOW = ref_pkt.RES[`DATA_WIDTH];
                    end
                    default : begin
                      ref_pkt.RES = 0;
                      ref_pkt.ERR = 1;
                    end
                  endcase
                end
                2'b10 : begin
                  case(ref_pkt.CMD)
                    4'b0110 : begin
                      ref_pkt.RES = ref_pkt.OPB + 1;
                      ref_pkt.COUT = ref_pkt.RES[`DATA_WIDTH];
                    end
                    4'b0111 : begin
                      ref_pkt.RES = ref_pkt.OPB - 1;
                      ref_pkt.OFLOW = ref_pkt.RES[`DATA_WIDTH];
                    end
                    default : begin
                      ref_pkt.RES = 0;
                      ref_pkt.ERR = 1;
                    end
                  endcase
                end
                2'b11 : begin
                  case(ref_pkt.CMD)
                    4'b0000 : begin 				//ADD
                      ref_pkt.RES = ref_pkt.OPA + ref_pkt.OPB;
                      ref_pkt.COUT = ref_pkt.RES[`DATA_WIDTH];
                    end
                    4'b0001 : begin 				//SUB
                      ref_pkt.RES = ref_pkt.OPA - ref_pkt.OPB;
                      ref_pkt.OFLOW = ref_pkt.RES[`DATA_WIDTH];
                    end
                    4'b0010 : begin 				//ADD_CIN
                      ref_pkt.RES = ref_pkt.OPA + ref_pkt.OPB + ref_pkt.Cin;
                      ref_pkt.COUT = ref_pkt.RES[`DATA_WIDTH];
                    end
                    4'b0011 : begin 				//SUB_CIN
                      ref_pkt.RES = ref_pkt.OPA - ref_pkt.OPB - ref_pkt.Cin;
                      ref_pkt.OFLOW = ref_pkt.RES[`DATA_WIDTH];
                    end
                    4'b0100 : begin
                      ref_pkt.RES = ref_pkt.OPA + 1;		//INC_A
                      ref_pkt.COUT = ref_pkt.RES[`DATA_WIDTH];
                    end
                    4'b0101 : begin				//DEC_A
                      ref_pkt.RES = ref_pkt.OPA - 1;
                      ref_pkt.OFLOW = ref_pkt.RES[`DATA_WIDTH];
                    end
                   4'b0110 : begin				//INC_B
                      ref_pkt.RES = ref_pkt.OPB + 1;
                      ref_pkt.COUT = ref_pkt.RES[`DATA_WIDTH];
                    end
                    4'b0111 : begin				//DEC_B
                      ref_pkt.RES = ref_pkt.OPB - 1;
                      ref_pkt.OFLOW = ref_pkt.RES[`DATA_WIDTH];
                    end
                    4'b1000 : begin 				//CMP
                      if(ref_pkt.OPA > ref_pkt.OPB)
                        ref_pkt.G = 1;
                      else if(ref_pkt.OPA < ref_pkt.OPB)
                        ref_pkt.L = 1;
                      else
                        ref_pkt.E = 1;
                    end
                    4'b1001 : begin 				//INC_A*INC_B
                      ref_pkt.RES = (ref_pkt.OPA + 1) * (ref_pkt.OPB + 1);
                    end
                    4'b1010 : begin 				//SHL1_A*B
                      ref_pkt.RES = (ref_pkt.OPA << 1) * (ref_pkt.OPB);
                    end
                    default : begin
                      ref_pkt.RES = 0;
                      ref_pkt.ERR = 1;
                    end
                  endcase
                end
                default : begin
                  ref_pkt.RES = 0;
                  ref_pkt.ERR = 1;
                end
              endcase
          end

          else begin  						// MODE = 0 LOGICAL
            case(ref_pkt.inp_valid)
              2'b00 : begin 
                ref_pkt.RES = 0;
                ref_pkt.ERR = 1;
              end 
              2'b01 : begin 					//OPA_ONLY
                case(ref_pkt.CMD)
                  4'b0110 : begin 
                    ref_pkt.RES = ~(ref_pkt.OPA);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b1000 : begin 
                    ref_pkt.RES = (ref_pkt.OPA >> 1);
                  end 
                  4'b1001 : begin 
                    ref_pkt.RES = (ref_pkt.OPA << 1);
                  end 
                  default : begin 
                    ref_pkt.RES = 0;
                    ref_pkt.ERR = 1;
                  end 
                endcase
              end 
              2'b10 : begin 					//OPB_ONLY
                case(ref_pkt.CMD)
                  4'b0111 : begin 
                    ref_pkt.RES = ~(ref_pkt.OPB);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b1010 : begin 
                    ref_pkt.RES = (ref_pkt.OPB >> 1);
                  end 
                  4'b1011 : begin 
                    ref_pkt.RES = (ref_pkt.OPB << 1);
                  end 
                  default : begin 
                    ref_pkt.RES = 0;
                    ref_pkt.ERR = 1;
                  end 
                endcase
              end 
              2'b11 : begin 					//A_B_VALID
                case(ref_pkt.CMD)
                  4'b0000 : begin 				//AND
                    ref_pkt.RES = ref_pkt.OPA & ref_pkt.OPB;
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b0001 : begin 				//NAND
                    ref_pkt.RES = ~(ref_pkt.OPA & ref_pkt.OPB);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b0010 : begin 				//OR
                    ref_pkt.RES = (ref_pkt.OPA | ref_pkt.OPB);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b0011 : begin 				//NOR
                    ref_pkt.RES = ~(ref_pkt.OPA | ref_pkt.OPB);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b0100 : begin 				//XOR
                    ref_pkt.RES = (ref_pkt.OPA ^ ref_pkt.OPB);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b0101 : begin 				//XNOR
                    ref_pkt.RES = ~(ref_pkt.OPA ^ ref_pkt.OPB);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b1100 : begin 				//ROL_A_B
                    if(| (ref_pkt.OPB[`DATA_WIDTH-1 : `SHIFT_WIDTH + 1])) begin
                      ref_pkt.ERR = 1;
                      ref_pkt.RES = 0;
                    end
                    else
                      ref_pkt.RES = (ref_pkt.OPA << ref_pkt.OPB[`SHIFT_WIDTH - 1:0]) | (ref_pkt.OPA >> (`DATA_WIDTH - ref_pkt.OPB[`SHIFT_WIDTH - 1: 0]));
                  end 
                  4'b1101 : begin 				//ROR_A_B
                    if(| (ref_pkt.OPB[`DATA_WIDTH-1 : `SHIFT_WIDTH + 1])) begin
                      ref_pkt.ERR = 1;
                      ref_pkt.RES = 0;
                      end
                    else
                      ref_pkt.RES = (ref_pkt.OPA >> ref_pkt.OPB[`SHIFT_WIDTH - 1:0]) | (ref_pkt.OPA << (`DATA_WIDTH - ref_pkt.OPB[`SHIFT_WIDTH - 1: 0]));
                  end 

                  4'b0111 : begin 				//NOT_B
                    ref_pkt.RES = ~(ref_pkt.OPB);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b1010 : begin 				//SHR1_B
                    ref_pkt.RES = (ref_pkt.OPB >> 1);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b1011 : begin 				//SHL1_B
                    ref_pkt.RES = (ref_pkt.OPB << 1);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 

                  4'b0110 : begin 				//NOT_A
                    ref_pkt.RES = ~(ref_pkt.OPA);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 	
                  4'b1000 : begin 				//SHR1_A
                    ref_pkt.RES = (ref_pkt.OPA >> 1);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 
                  4'b1001 : begin 				//SHL1_A
                    ref_pkt.RES = (ref_pkt.OPA << 1);
                    ref_pkt.RES[`DATA_WIDTH] = 0;
                  end 

                  default : begin 
                    ref_pkt.RES = 0;
                    ref_pkt.ERR = 1;
                  end 
                endcase
              end 
              default : begin   
                ref_pkt.RES = 0;
                ref_pkt.ERR = 1;
              end 
            endcase
          end 

        end


  endtask
 

  function void write(seq_item req);
    $display("pkt received in scoreboard");
    scb_queue.push_back(req);
  endfunction

  task run_phase(uvm_phase phase);
    int ERR;
    	//repeat(1)@(ref_vif.ref_cb);
    forever begin
      wait(scb_queue.size > 0);
      scb_item = scb_queue.pop_front();

      void'(uvm_config_db#(int)::get(this,"","ERR",ERR));
      ref_pkt.ERR = ERR;
      
      ref_pkt.copy(scb_item);
      alu_operation(ref_pkt);
      `uvm_info(get_type_name(),$sformatf("| REF_MODEL | RES = %0d | ERR = %0d |",ref_pkt.RES,ref_pkt.ERR),UVM_MEDIUM)
      if(scb_item.compare(ref_pkt)) begin
        `uvm_info(get_type_name(),"!! PASS !! ",UVM_MEDIUM)
        $display("");
        match++;
      end
      else begin
        `uvm_info(get_type_name(),"!! FAIL !! ",UVM_MEDIUM)
        $display("");
        mismatch++;
      end
      $display("");
      `uvm_info(get_type_name(),$sformatf("TOTAL MATCH = %0d | TOTAL MISMATCH = %0d",match,mismatch),UVM_MEDIUM);
      $display("------------------------------------------------------------------------------- TESTBENCH -------------------------------------------------------------------------------");
      $display("");
    end    
  endtask

endclass
