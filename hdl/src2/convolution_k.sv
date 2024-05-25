/*	
   ===================================================================
   Module Name  : convolution_k
   Author: Jaciel Hernandez Resendiz   
   Filename     : convolution_k.sv
   Type         : Verilog Module
   Description  : Modulo que permite acumular el índice externo de la operación de convolucíon.
                  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/
module convolution_k
#(
	parameter DATA_WIDTH =  5
)(
	input wire                    clk,
	input wire                    rstn,
   //input wire                    clrh,   
   //--------Control signals----------//
	input wire                    enh,
   //--------Data/addr signals--------//
	input wire [DATA_WIDTH-1:0]   data_k,
	output reg [DATA_WIDTH-1:0]   data_o
);

always@(posedge clk, negedge rstn) begin
	if(~rstn) 
		data_o <= 5'b0;
	else if (enh)
		data_o <= data_k+1'b1;
   //else if (clrh)
   //   data_o <= {DATA_WIDTH{1'b0}};
   else
      data_o <= data_k;
	
end
endmodule