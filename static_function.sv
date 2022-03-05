/*
Class to explain the usage of static function in system verilog. Static functions takes in static variables and can be called
without creating the object of the class.
*/

class Packet;
bit [3:0] paddr,crc;
static int id=3;

  function new(input bit [3:0] paddr_c, input bit [3:0] crc_c);
  paddr=paddr_c;
  crc=crc_c;
endfunction
  
  static function print_id();
    $display("static variable value is %d",id);
  endfunction
           
  
  endclass

module tb;
  
  initial begin
    Packet p,q;
    p.print_id();
    p=new(4,10);
    q=new(3,6);
    $display("value of packet paddr,crc and id is %d %d %d",p.paddr,p.crc,p.id);
    $display("value of packet paddr,crc and id is %d %d %d",q.paddr,q.crc,q.id);
    q.id = 5;
    $display("value of packet paddr,crc and id is %d %d %d",p.paddr,p.crc,p.id);
    $display("value of packet paddr,crc and id is %d %d %d",q.paddr,q.crc,q.id);
  end 
  
endmodule
