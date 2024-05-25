/*	
   ===================================================================
   Module Name  : convolution_j
   Author: Jaciel Hernandez Resendiz   
   Filename     : convolution_j.sv
   Type         : Verilog Module
   Description  : Modulo que permite acumular el índice interno de la operación de convolucíon.
                  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/

module convolution_j
#(
	parameter DATA_WIDTH =  5
)(
	input                   clk,
	input                    rstn,
    //input wire                    clrh,   
   //--------Control signals----------//
	input                   enh,
   //--------Data/addr signals--------//
	input reg [DATA_WIDTH-1:0]   inicio_i,
    input reg [DATA_WIDTH-1:0]   j_i,
	output reg [DATA_WIDTH-1:0]   data_o
);

always@(posedge clk, negedge rstn) begin
	if(!rstn) begin data_o <= inicio_i; end
		//data_o <= {DATA_WIDTH{1'b0}};
	else if (enh) data_o <= j_i+1'b1;
    else data_o <= j_i;
	
end
endmodule