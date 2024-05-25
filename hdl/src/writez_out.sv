module writez_out

(
   input reg [15:0] dataZin,
   input en_write,
   output reg writeZ,
   output reg [15:0] dataZout
 );
 
 always @(*) begin
 
   if (en_write) begin writeZ=1'b1; dataZout= dataZin; end
   else writeZ=1'b0;
 end 
  
 endmodule 