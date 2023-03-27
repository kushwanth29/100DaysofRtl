`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2023 06:14:37 PM
// Design Name: 
// Module Name: paritygentb
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


module paritygentb();
reg x,y,z;
wire result;
paritygen aa(.x(x),.y(y),.z(z),.result(result));
initial
begin
x=0;
y=0;
z=0;
#100
x=1;
y=1;
z=1;
#100
x=1;
y=0;
z=1;

end

endmodule
