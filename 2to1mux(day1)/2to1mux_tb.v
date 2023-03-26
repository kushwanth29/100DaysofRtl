//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2023 11:13:27 PM
// Design Name: 
// Module Name: 2to1mux_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module 2to1mux_tb();
   reg a,b,sel;
   wire out;
2to1mux aa(.a(a),.b(b),sel(sel),.out(out));
   initial 
   begin;
   #10 a=2'b11;
       b=2'b00;
       sel=1'b0;
    #2
     a=2'b11;
        b=2'b00;
        sel=1'b0;    
        
        $finish;
        
        end
  always@(out)
  begin
  $display("out=%b",out);
   end
endmodule
