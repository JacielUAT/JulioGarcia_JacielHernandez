/*	
   ===================================================================
   Module Name  : convolution_left
   Author: Jaciel Hernandez Resendiz   
   Filename     : convolution_left.sv
   Type         : Verilog Module
   Description  : Modulo que permite calcular el limite inferior y superior para ser considerados
                  cuando el modo de convolución sea SAME. También regresa una bandera si el ínidice 
                  k se encuentra dentro de estos limites.
                  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/
module convolution_left#(
   parameter DATAWIDTH =5)
(
	input clk,
	input reg [DATAWIDTH-1:0] k_i,	
    input reg [DATAWIDTH-1:0] sizeX, 
    output reg [DATAWIDTH-1:0] left_o,
	output reg [DATAWIDTH-1:0] rigth_o,
	output reg comp_o
);
always @ (posedge clk) begin
   left_o <= ((sizeX -1'b1) /2)-2'b10 ;
   rigth_o <= ((sizeX -1'b1) /2) + sizeX-2'b10;
   if (k_i <= (left_o-1'b1) | k_i >= rigth_o)comp_o= 1'b1;
   else comp_o= 1'b0; 
	  
end 
//assign left_o = ((sizeX - 1)/2)-1;

endmodule