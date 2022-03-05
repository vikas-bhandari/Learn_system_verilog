/* 
System verilog code to create a class packet and then initialize the variables with new function which is a constructor. 
We then use $display to print the value of the variables.
*/

class Packet;
bit [3:0] paddr,crc;

  function new(input bit [3:0] paddr_c, input bit [3:0] crc_c);
  paddr=paddr_c;
  crc=crc_c;
  endfunction
endclass

module tb;
  
  initial begin
    Packet p;
    p=new(4,10);
    $display("value of packet paddr,crc and id is %d %d",p.paddr,p.crc);
  end 
  
endmodule
