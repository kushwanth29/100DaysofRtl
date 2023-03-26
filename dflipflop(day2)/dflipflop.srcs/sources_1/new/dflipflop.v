module DFF(Clk,CE,reset,D,set,Q );
        
    input Clk;
    input CE;
     input reset;
     input D;
     input set;
 
    output Q;

     reg Q;
     
    always @(posedge(Clk))
    begin
        if(Clk == 1) 
        begin
            if (reset == 1) 
                Q = 0;  
            else if(set == 1)   
             Q = 1; 
         else if (CE == 1) 
                 Q = D;       
      end      
    end 
    endmodule