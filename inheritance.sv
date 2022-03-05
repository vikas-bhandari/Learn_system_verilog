/*
Class to explain the concept of inheritance in system verilog. 
All the base class properties are available in derived class also. 
Below code also explains that if the consturctor arguments are different then we need to add super.new() function in the class.
*/

class Packet;
bit [3:0] paddr,crc;
static int id=3;

  function new(input bit [3:0] paddr_c, input bit [3:0] crc_c);
  paddr=paddr_c;
  crc=crc_c;
endfunction
           
  endclass

class subpacket extends Packet;
  bit [2:0] length;
  function new(input bit [2:0] length_c);
    super.new(paddr,crc);
    length = length_c;
  endfunction
endclass

module tb;
  
  initial begin
    Packet p,q;
    subpacket r;
    p=new(4,10);
    q=new(3,6);
    r=new(2);
    $display("value of packet paddr,crc and id is %d %d %d",p.paddr,p.crc,p.id);
    $display("value of packet paddr,crc and id is %d %d %d",q.paddr,q.crc,q.id);
    $display("value of subclass packet paddr,crc and length is %d %d %d",r.paddr,r.crc,r.length);
  end 
  
endmodule
