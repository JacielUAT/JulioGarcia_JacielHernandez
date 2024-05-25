/*	
   ===================================================================
   Module Name  : convolucion_count
   Author: Jaciel Hernandez Resendiz
   Filename     : convolucion_count.v
   Type         : Verilog Module
   
   Description  : Este bloque calcula el tamaño del resultado de la operación de convolución
				 este valor permite controlar elíndice externo de la operación de convolución                  
                  Version     : 1.0
   Data        : 02 May 2024
   Revision    : -
   Reviser     : -		

*/

module convolution_count#(
   parameter DATAWIDTH =5)
(
    input wire clk,
    //input rstn,
    //input clrh,
    //input wire enh,
    input wire [DATAWIDTH-1:0] a, 
    input wire [DATAWIDTH-1:0] b, 
    output reg [DATAWIDTH-1:0] sum_o
);

always@(posedge clk) begin
		sum_o <= ((a + b)-1'b1);
   //else if (clrh)
   //   sum_o <= {DATA_WIDTH{1'b0}};
	
end

endmodule