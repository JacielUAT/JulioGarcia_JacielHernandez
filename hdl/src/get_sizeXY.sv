/*	
   ===================================================================
   Module Name  : get_sizeXY
   Author: CINVESTAV
   Filename     : get_sizeXY.sv
   Type         : Verilog Module
   Author: Jaciel CINVESTAV  
   Description  : Este bloque guarda el tamano de la memoria X y Y
                  Version     : 1.0
   Data        : 24 May 2024
   Revision    : -
   Reviser     : -		

*/

module get_sizeXY
(
	input clk,	
   input bitgate,
   input reg [4:0] sizeX,
   input reg [4:0] sizeY,
	output reg [4:0] sizeX_,
   output reg [4:0] sizeY_
   
);


always@(posedge clk) begin 
   if (bitgate) begin
      sizeX_ = sizeX;
      sizeY_ = sizeY;
     
     
      
   end
   else begin
      sizeX_=sizeX;
      sizeY_=sizeY;    
      
   end  
   
end

endmodule 