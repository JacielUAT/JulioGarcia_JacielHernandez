/*	
   ===================================================================
   Module Name  : convolution_set_addr
   Author: Jaciel Hernandez Resendiz   
   Filename     : convolution_set_addr.sv
   Type         : Verilog Module
   
   Description  : Este bloque permite asigar las direcciones de memoria, para su consulta
				  en las memorias externas.
                  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/
module convolution_set_addr
#(
   parameter DATA_WIDTH = 5,parameter DATA_WIDTH_ADDR = 5, parameter MEM_ADDR_Z_SIZE = 16 
)(
   input              clk,
	input reg [DATA_WIDTH-1:0]  j_i,
	input reg [DATA_WIDTH-1:0]  k_i, 
	output reg [DATA_WIDTH_ADDR-1:0] addrX_o,
   output reg [DATA_WIDTH_ADDR-1:0] addrY_o,
   output reg [DATA_WIDTH_ADDR:0] addrZ_o
);
always@(posedge clk) begin
      addrX_o <= j_i;
      addrY_o <= k_i-j_i;
      addrZ_o <= k_i;
end

endmodule
