module convolution_fin#(
   parameter DATAWIDTH =8)
(
    input wire [DATAWIDTH-1:0] sizeX,
    input wire [DATAWIDTH-1:0] k, 
    output logic fin_o
);

assign fin_o = ( k < sizeX ) ? k : sizeX;
endmodule