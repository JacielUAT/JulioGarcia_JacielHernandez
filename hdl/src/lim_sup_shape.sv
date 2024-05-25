module lim_sup_shape
(   
   input clk,
   input reg [4:0] sizeX,
   output reg [4:0] sup

);

always@(posedge clk) begin
   sup <= ((sizeX -1'b1) /2) + sizeX-2'b10;
end 

endmodule 