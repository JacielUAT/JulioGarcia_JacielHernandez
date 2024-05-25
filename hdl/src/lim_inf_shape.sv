module lim_inf_shape
(  
   input clk,
   input reg [4:0] sizeX,
   output reg [4:0] inf

);

always @ (posedge clk) begin
   inf <= ((sizeX -1'b1) /2)-2'b10 ;
end 

endmodule 