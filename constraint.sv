/*
Code showing constraint usage in system verilog where we want to restrict the randomization on variables. 
Also post_randomize function is added in the class to calculate whether address generated is even or odd. 
We can do some preprocesssing and post processing on the random variables using pre_randomize() and post_randomize() function.
*/

class base;

  rand bit[2:0] paddr;
  randc bit [2:0] length;
  rand bit id;
  bit odd_or_even;
  
  constraint c1 {
    length inside {2,3,4};
  }
  
  constraint c2 {
    paddr dist { [0:3]:=2 , [4:7]:=1};
  }
  
  function void post_randomize();
    if(paddr[0] == 1) 
      odd_or_even = 1;
    else
      odd_or_even = 0;
  endfunction 
 
  endclass

module tb;
  
  initial begin
    base b1=new();
    repeat(10) begin
      b1.randomize();
      $display("value of paddr, length and id is %d %d %d %d",b1.paddr,b1.length,b1.id,b1.odd_or_even);
    end
  end 
  
endmodule
