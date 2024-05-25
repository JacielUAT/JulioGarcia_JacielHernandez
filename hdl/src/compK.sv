/*	
   ===================================================================
   Module Name  : compK
   Author: CINVESTAV   
   Filename     : compK.sv
   Type         : Verilog Module
   Author: CINVESTAV
   Description  : Modulo de comparacion
                  
                  Version     : 1.0
   Data        : 24 May 2024
   Revision    : -
   Reviser     : -		

*/
module compK 
(		
   input reg [5:0] K,
   input reg [5:0] temp_adder,  
	output reg comp_out	
);

always@ (*) begin

   if (K < temp_adder) begin
      comp_out= 1'b1;      
   end 
   else 
      comp_out= 1'b0;      
end 

endmodule 