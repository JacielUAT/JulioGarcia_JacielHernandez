/*	
   ===================================================================
   Module Name  : convolucion_top
    Author: Jaciel Hernandez Resendiz
   Filename     : convolucion_top.sv
   Type         : Verilog Module
   
   Description  : Este bloque realiza el la operación de convolución de los datos datoX  y datoY 
                  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/
module convolution #(parameter MEM_ADDR_Z_SIZE = 16, 
                         parameter DATAWIDTH_X = 8,
                         parameter DATAWIDTH_Y = 8, 
                         parameter SIZE_X = 5, 
                         parameter SIZE_Y= 5,
                         parameter DATAWIDTH_Z = 16,
						 parameter MEM_ADDR_XY_SIZE = 5,
						 parameter DATAWIDTH = 5)

                         
                         (
                         input clk,
                         input rstn,
                         input start,
                         input reg [DATAWIDTH_X-1:0] dataX,
                         input reg [SIZE_X-1:0] sizeX,
                         input reg [DATAWIDTH_Y-1:0] dataY,
                         input reg [SIZE_Y-1:0] sizeY,
                         input shape,
                         output reg [DATAWIDTH_Z-1:0] dataZ,
                         output reg [MEM_ADDR_XY_SIZE:0] memZ_addr,
                         output reg [MEM_ADDR_XY_SIZE-1:0] memX_addr,
                         output reg [MEM_ADDR_XY_SIZE-1:0] memY_addr,
                         output writeZ,
                         output busy,
                         output done);

                         
wire [DATAWIDTH_Z-1:0] dataZ_w;
wire ctrl_count;
wire datogate;
wire comp1;
wire com_k_until_w;
wire flag_j_fin_w;
wire enable_k;
wire clr_k;

wire enable_j;
wire clr_j;

wire [DATAWIDTH-1:0] until_fin;
wire clr_count;
wire enable_count;

wire enable_z;
wire  clr_z;
wire writeZ_w;
wire [MEM_ADDR_XY_SIZE-1:0] j_w; 
wire [MEM_ADDR_XY_SIZE-1:0] k;
wire comp_o;
wire [DATAWIDTH-1:0] left_w;
wire [DATAWIDTH-1:0] rigth_w;
convolution_fsm dut_fsmV2(
						.clk(clk),
                        .rstn(rstn),
						.start(start),
						.com_k_until(com_k_until_w),//k}
						.clr_k(clr_k),  //output
						.clr_j(clr_j), //output
						.shape(shape),
						.writeZ(writeZ),
						.enable_j(enable_j),
						.enable_k(enable_k),
						.flag_j_fin_w(flag_j_fin_w),
						.enable_z(enable_z),
						.clr_z(clr_z),
						
						.clr_count(clr_count),
						
						.enable_count(enable_count), //output
						
						.busy(busy),
                        .done(done),
						.comp_o(comp_o)
						);
//.clr_k(clr_k)
//.clr_j(clr_j)
/*
convolution_fsm dut_fsm(
                  .clk(clk),
                  .rstn(rstn),
                  .start,
                  .clr_k(clr_k)
                  .enable_k(enable_k),
                  .clr_k(clr_j),
                  .clr_k(enable_k),
                  .com_k_until(com_k_until),
                  .ctrl_count(ctrl_count),
                  .writeZ(writeZ),
                  .busy(busy),
                  .done(done),
                  .datogate(datogate),
                  .comp1(comp1),
                  .shape(shape),
                  .comp2(comp2),
                  
                  
                  );
                         
          */               

//wire clr_j;


      


convolution_count dut_count (
	 .clk(clk),
    //.rstn(clr_count),
    //.clrh(clr_count),
    //.enh(enable_count),
    .a(sizeX),
    .b(sizeY),
    .sum_o(until_fin)
	 
);
comparatorGreaterThan dut_GreaterThan(
	.A_i(k),
	.B_i(until_fin), 
	.A_greater_than_B_o(com_k_until_w)                  
);

convolution_k dut_k
      (
         .clk     (clk),
         .rstn    (clr_k),
         //.clrh    (clr_k),   
         .enh     (enable_k),
         .data_k  (k),
         .data_o  (k)
      );
//calcula el rango que va tomar j
wire [DATAWIDTH-1:0] inicio_w;
wire [DATAWIDTH-1:0] fin_w;
wire [DATAWIDTH-1:0] suma;
convolution_inicio_fin dut_inicio_fin
   (
    .clk(clk),
    .sizeY(sizeY),
    .sizeX(sizeX),
    .k(k), 
    .inicio_o(inicio_w),
    .fin_o(fin_w),
	.suma(suma)
);

convolution_j dut_j (
	.clk(clk),
	.rstn(clr_j),
   //.clrh(clr_j),
   .enh(enable_j),
   .inicio_i(inicio_w),
   .j_i(j_w),
	.data_o(j_w)
);
//compara si j > a fin
//pasar assing
convolution_compj_fin dut_compj_fin
   (
    .j(j_w),
    .fin(fin_w), 
    .flag_o(flag_j_fin_w)
    );

    
convolution_set_addr dut_set_addr(
    .clk(clk),
	.j_i(j_w),
	.k_i(k), 
	.addrX_o(memX_addr),
   .addrY_o(memY_addr),
   .addrZ_o(memZ_addr)
);
/*
dut convolution_operationXY(
(
    .dataX(dataX),
    .input wire [DATAWIDTH-1:0] dataY,
    .input wire [DATAWIDTH-1:0] dataZ, 
    .output logic z_o
);*/


//reg [15:0] dataZ;   
//acumulacion de Z
convolution_acc dut_acc(
   .clk(clk),
	.rstn(clr_z),
   //.clrh(clr_z),   
   .enh(enable_z),
   .dataX_i(dataX),
   .dataY_i(dataY),
   .dataZ_i(dataZ),
   .dataZ_o(dataZ)
);


convolution_left dut_left_rigth(
	.clk(clk),
	.k_i(k), 
    .sizeX(sizeX), 
    .left_o(left_w),
	.rigth_o(rigth_w),
	.comp_o(comp_o)
);

                         
endmodule