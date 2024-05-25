/*	
   ===================================================================
   Module Name  : convolution_TB
   Author: Jaciel Hernandez Resendiz   
   Filename     : convolution_TB.sv
   Type         : Verilog Module
   Description  : Modulo que permite simular testbech para la operación de convolucion  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/

`timescale 1ns/1ns
module convolution_TB;



parameter DATAWIDTH_Z = 16;
parameter MEM_ADDR_Z_SIZE = 16;

parameter MEM_ADDR_XY_SIZE = 5;
parameter DATAWIDTH_X = 8;
parameter SIZE_X= 5;

parameter DATAWIDTH_Y = 8;
parameter SIZE_Y= 5;




//addres
wire [MEM_ADDR_XY_SIZE-1:0] memX_addr;
wire [MEM_ADDR_XY_SIZE-1:0] memY_addr;
wire [MEM_ADDR_XY_SIZE:0] memZ_addr;

//data
wire [DATAWIDTH_Z-1:0] dataZ;
reg [DATAWIDTH_X-1:0] dataX;
reg [DATAWIDTH_Y-1:0] dataY;

//Entradas del modulo de convolucion
reg clk;
reg rstn;
reg start;
reg shape;

//SALIDAS
wire writeZ;
wire busy;
wire done;

//SIZES
reg [SIZE_X-1:0] sizeX;
reg [SIZE_Y-1:0] sizeY;

//Modulo de convolución
convolution dut(     .clk(clk),
                         .rstn(rstn),
                         .start(start),
                         .dataX(dataX),
                         .sizeX(sizeX),
                         .dataY(dataY),
                         .sizeY(sizeY),
                         .shape(shape),
						 .dataZ(dataZ),
                         .memZ_addr(memZ_addr),
                         .memX_addr(memX_addr),
                         .memY_addr(memY_addr),
                         .writeZ(writeZ),
                         .busy(busy),
                         .done(done));

//Memoria X
simple_dual_port_ram_single_clk_svX dut_simple_dual_port_ram_single_clk_svX 
		(
		.clk(clk),		
		.write_en_i(1'b0),
		.write_addr_i(5'b0),				
		.read_addr_i(memX_addr),
		.write_data_i(5'b0),
		.read_data_o(dataX)
	   
);
//Memoria Y
simple_dual_port_ram_single_clk_svY dut_simple_dual_port_ram_single_clk_svY
		(
		.clk(clk),		
		.write_en_i(1'b0),
		.write_addr_i(5'b0),				
		.read_addr_i(memY_addr),
		.write_data_i(5'b0),
		.read_data_o(dataY)
	   
);


wire [7:0] data_o;
simple_dual_port_ram_single_clk_svZ dut_simple_dual_port_ram_single_clk_svZ
(
		.clk(clk),		
		.write_en_i(writeZ),
		.write_addr_i(memZ_addr),				
		.read_addr_i(6'b0),
		.write_data_i(dataZ),
		.read_data_o(data_o)
	   
);

initial begin
	clk=0;
	forever
	begin
    clk= !clk;
	#10;
	end
end
          

initial begin
#0 rstn=1'b0;
   shape=1'b0;
   clk=1'b0;
   start=1'b0;
   
#10 rstn=1'b0;
   shape=1'b0;

   start=1'b1;
   sizeX =5'b01010;
   sizeY =5'b00101;   
   
#10 rstn=1'b0; 
   
#10 rstn=1'b1;
    
end
		
/*
initial begin
#10 rstn=1'b0;
   shape=1'b0;
   clk=1'b0;
   start=1'b0;
   
#0 rstn=1'b0;
   shape=1'b0;
   clk=1'b0;
   start=1'b1;
   sizeX =5'b00011;
   sizeY =5'b00111;
   
   
#10 rstn=1'b0;
    clk=1'b1;
    start=1'b1;
   
#10 rstn=1'b1;
    clk=1'b0;
    start=1'b1;
   
#10 rstn=1'b1;
    clk=1'b1;
    start=1'b1;
   
   
#10 start=1'b1;
    clk=1'b0;
    
   
#10 start=1'b1;
    clk=1'b1; 
    
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1;  
    
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1;  

#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
   
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;
#10 start=1'b1;
    clk=1'b1; 
#10 start=1'b1;
    clk=1'b0;


	end
*/
endmodule