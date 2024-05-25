/*	
   ===================================================================
   Module Name  : convolution_inicio_fin
   Author: Jaciel Hernandez Resendiz   
   Filename     : convolution_inicio_fin.sv
   Type         : Verilog Module
   Author: Jaciel Hernandez Resendiz  
   Description  : Este modulo calcula los límites de ciclo interno para la operación de convolución
                  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/
module convolution_inicio_fin#(
   parameter DATAWIDTH =5)
(   input               clk,
    input reg [DATAWIDTH-1:0] sizeY,
    input reg [DATAWIDTH-1:0] sizeX,
    input reg [DATAWIDTH-1:0] k, 
    output reg [DATAWIDTH-1:0] inicio_o,
    output reg [DATAWIDTH-1:0] fin_o,
	output reg [DATAWIDTH-1:0] suma
);
reg signed [DATAWIDTH-1:0] suma_2;
reg signed [DATAWIDTH-1:0] resta_2;
//assign add = (k + sizeY)-1;
always@(*) begin
   suma=(k - sizeY + 1'b1);
   suma_2=(k - sizeY + 1'b1);
   resta_2=(sizeX - 1'b1);
   inicio_o = (0 > suma_2) ? 0 : suma_2;
   fin_o = ( k < resta_2) ? k : resta_2;

end

endmodule