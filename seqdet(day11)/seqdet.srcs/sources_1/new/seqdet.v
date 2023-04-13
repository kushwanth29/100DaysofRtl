`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2023 02:23:38 PM
// Design Name: 
// Module Name: seqdet
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


module seqdet(
    input clk,
    input reset,
    input seqin,
    output wire seqdet
    );
    
    parameter[2:0] start=3'b000,
                    a=3'b001, b=3'b010,
                    c=3'b011,d=3'b100,
                    accept=3'b101;
                    
    reg[2:0] current_state;
    reg[3:0] shift_reg;
    
    
    
    assign seqdet = (current_state==accept);
    
    always @(posedge clk)
      begin
      if(reset)
      begin
      current_state<=start;
      shift_reg=4'b0000;
      end
      
      else 
      begin
      case(current_state)
      start:begin
      if(seqin==1)
      current_state<=a;
      else
      current_state<=start;
      end
      
  
      
       a: begin
      shift_reg <={shift_reg[2:0],seqin};
      if(shift_reg==4'b1110)
      current_state<=b;
      else
      current_state<=a;
      end
      
      
       b: begin
      shift_reg <={shift_reg[2:0],seqin};
      if(shift_reg==4'b1101)
      current_state<=c;
      else
      current_state<=b;
      end
      
          c: begin
      shift_reg <={shift_reg[2:0],seqin};
      if(shift_reg==4'b1011)
      current_state<=d;
      else
      current_state<=c;
      end
      
          d: begin
      shift_reg <={shift_reg[2:0],seqin};
      if(seqin==1)
      current_state<=accept;
      else
      current_state<=d;
      end
      
       accept: begin
                current_state <= start;
                shift_reg <= 4'b0000;
            end
       
      endcase
      end
      
      end
    
                 
    
    
endmodule
