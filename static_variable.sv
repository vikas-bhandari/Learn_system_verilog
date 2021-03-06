/*
Class to explain the usage of static variable in system verilog. Static variables
are shared across the class which is explained in below example.
In the below example value of variable id is shared across class instances.
*/

class Packet;
bit [3:0] paddr,crc;
static int id;

  function new(input bit [3:0] paddr_c, input bit [3:0] crc_c);
  paddr=paddr_c;
  crc=crc_c;
endfunction
  endclass

module tb;
  
  initial begin
    Packet p,q;
    p=new(4,10);
    q=new(3,6);
    $display("value of packet paddr,crc and id is %d %d %d",p.paddr,p.crc,p.id);
    $display("value of packet paddr,crc and id is %d %d %d",q.paddr,q.crc,q.id);
    q.id = 5;
    $display("value of packet paddr,crc and id is %d %d %d",p.paddr,p.crc,p.id);
    $display("value of packet paddr,crc and id is %d %d %d",q.paddr,q.crc,q.id);
  end 
  
endmodule
