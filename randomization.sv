/*
randomization of variables in system verilog. System verilog supports 2 types of randomization. rand and randc.
In case of rand one random input is picked out of all the possible inputs. In case of randc we ensure that each and every input is randomized before repeating it.
Example if there is a 2 bit variable and if we do randomization 4 times randc will ensure that inputs are always 0,1,2 and 3 but order of these inputs will vary. 
In case of rand declaration it can be anything and we may even see a randomization with a case like 0,0,0,0 which is not possible with randc.
*/

class base;

  rand bit[2:0] paddr;
  randc bit [2:0] length;
 
  endclass

module tb;
  
  initial begin
    base b1=new();
    repeat(10) begin
      b1.randomize();
      $display("value of paddr and length is %d %d",b1.paddr,b1.length);
    end
  end 
  
endmodule
