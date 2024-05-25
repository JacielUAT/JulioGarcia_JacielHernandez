/*	
   ===================================================================
   Module Name  : convolution_acc
   Author: Jaciel Hernandez Resendiz   
   Filename     : convolution_acc.sv
   Type         : Verilog Module
   Description  : Este modulo es el encarado de ir resguardando la sumatorioa en cada ciclo interno	
					de la operación de convolucón.
                  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/

module convolution_acc
#(
   parameter DATAWIDTH =8,parameter DATAWIDTHZ =16
)(
   input                     clk,
	input                     rstn,
   //input wire                    clrh,   
   //--------Control signals----------//
	input                    enh,
   //--------Data/addr signals--------//
	input reg [DATAWIDTH-1:0] dataX_i,
    input reg [DATAWIDTH-1:0] dataY_i,
    input reg [DATAWIDTHZ-1:0] dataZ_i,
	output reg [DATAWIDTHZ-1:0] dataZ_o
);

always@(posedge clk, negedge rstn) begin
	if(rstn==0) dataZ_o <= 15'b0;
	else if (enh) dataZ_o <= dataZ_i+(dataX_i*dataY_i);
	else dataZ_o <= dataZ_i;
	
end
endmodule