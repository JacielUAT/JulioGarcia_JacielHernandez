/*	
   ===================================================================
   Module Name  : convolution_compj_fin
   Author: Jaciel Hernandez Resendiz   
   Filename     : convolution_compj_fin.sv
   Type         : Verilog Module
   Description  : Este modulo valida si el ciclo interno de la operación de convolución ha terminando
                  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/
module convolution_compj_fin#(
   parameter DATAWIDTH =5)
(
    input reg [DATAWIDTH-1:0] j,
    input reg [DATAWIDTH-1:0] fin, 
    output reg flag_o
);
always@(*) begin
	flag_o = (j > (fin+1'b1))? 1'b1: 1'b0;
end
endmodule