/*
Class to explain the concept of virtual functions in system verilog and polymorphism. 
*/

class base;

  function void normal();
    $display("in normal base class function");
  endfunction
  
  virtual function void vfunc();
    $display("in virtual base class function");
  endfunction 
 
  endclass

class child extends base;

  function void normal();
    $display("in normal child class function");
  endfunction
  
  virtual function void vfunc();
    $display("in virtual child class function");
  endfunction 
 
  endclass

module tb;
  
  initial begin
    base b1;
    child c1;
    b1=new();
    c1=new();
    b1=c1; // Making base class instance point to derived class values
    b1.normal(); // Here base class function will be called
    b1.vfunc(); // Here child class function will be called as it is declared virtual.
  end 
  
endmodule
