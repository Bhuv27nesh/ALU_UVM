# ALU_UVM

## Project Overview
This project focuses on verifying a parameterized Arithmetic Logic Unit (ALU) that
performs arithmetic operations (addition, subtraction, increment, decrement,
multiplication), logical operations (AND, OR, XOR, NOT, NAND, NOR, XNOR), as well as
shift, rotate, comparator, and error-checking functions. Verification is carried out using
the Universal Verification Methodology (UVM) with constrained-random and directed
tests, assertions, and functional coverage to ensure correctness and robustness of the design.

## Verification Objective
->Verify functional correctness of all ALU operations — including arithmetic, logical, 
comparison, and shift/rotate — as determined by CMD and MODE.  
->Ensure input protocol compliance by checking that INP_VALID reflects operand 
availability (2'b01, 2'b10, or 2'b11) and operations proceed only when valid.   
->Verify that when only one operand is valid (INP_VALID = 2'b01 or 2'b10), the ALU 
waits up to 16 clock cycles for the second operand, and asserts ERR if it doesn’t 
arrive.   
->Confirm timing behaviour, ensuring results are available after 1 or 2 clock cycles, 
depending on the operation.   
->Apply constrained-random testing and functional coverage to explore all 
valid/invalid input combinations, including edge cases like overflow, underflow, and 
invalid rotate commands.   

##  TESTBENCH ARCHITECTURE
<img width="1711" height="812" alt="Image" src="https://github.com/user-attachments/assets/4476b116-f2d9-4d0b-84cf-dcac016cb217" />
