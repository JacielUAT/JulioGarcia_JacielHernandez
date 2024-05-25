/*	
   ===================================================================
   Module Name  : convolution_fsm
   Author: Jaciel Hernandez Resendiz   
   Filename     : convolution_fsm.sv
   Type         : Verilog Module
   Author: Jaciel Hernandez Resendiz  
   Description  : Este bloque permite controlar los estados para la operacion de convolución
                  
                  Version     : 1.0
   Data        : 05 May 2024
   Revision    : -
   Reviser     : -		

*/
module convolution_fsm (
						input logic clk,
                        input logic rstn,
                        input logic start,
						input logic com_k_until,
						input reg shape,
						input reg flag_j_fin_w,
						output reg enable_k,
						output reg enable_j,
						output reg clr_k,  //output
						output reg clr_j, //output
						output reg enable_count, //output
						output reg enable_z,
						output reg clr_count,
						output reg clr_z,
						output reg writeZ,
						output reg busy,
                        output reg done,
						input reg comp_o
						
);
						          
 enum {S0 =0,S1=1, S2=2, S3=3,S4=4,S5=5,S6=6, S7=7, S8=8, S9=9,S10=10,XX=22} state_t; 
             //state_t state;
             //state_t next;
			 reg [7:0] state;
			 reg [7:0] next;
             //(1) State register
             always_ff@(posedge clk or negedge rstn) begin
               if(!rstn) state <=  S0;
               else       state <= next;
             end 
             
             
             //(2) Combinational next state logic
             always @ (*)begin
               next = XX;
                case(state)
				  
                  S0: if(start) next = S1;
                        else next = S0;
				  S1: next = S2;
				  S2: next = S3;
                  S3: if(com_k_until) next = S10;
                        else next = S4;
                  S4: if(shape & comp_o) next = S8;
                        else next = S5;
				  S5:  
					  if(flag_j_fin_w)begin
						next = S7;
				      end else begin
						next = S6;
					  end
                  S6: next = S9; 
                  S7: next = S8;
                  S8: next = S2;
				  S9: next = S5;
				  S10: next = S0;
                  default: next =  S0;
                endcase
             end
             
             
             ///(3) registered output logic (Moore outputs)
             always@ (*) begin
               if(!start) begin
                  //com_k_until <= 1'b0;
                  //compj <= 1'b0;
                  clr_count = 1'b0;
				  clr_z = 1'b0;
                  writeZ = 1'b0;
                  //shape <= 1'b0;
                  busy = 1'b0;
                  done = 1'b0;
                  enable_k = 1'b0;
                  enable_j = 1'b0;
                  enable_z = 1'b0;
                  clr_j = 1'b0;
                  clr_k = 1'b0;
                  //clr_count <= 1'b0;
                  enable_count = 1'b0;
               end
               else begin
              
                  case(state)
                     S0:begin
						 //com_k_until <= 1'b0;
						  //compj <= 1'b0;
						  clr_count = 1'b0;
						  clr_z = 1'b0;
						  writeZ = 1'b0;
						  //shape <= 1'b0;
						  busy = 1'b0;
						  done = 1'b0;
						  enable_k = 1'b0;
						  enable_j = 1'b0;
						  enable_z = 1'b0;
						  clr_j = 1'b0;
						  clr_k = 1'b0;
						  enable_count = 1'b0;
                        end
                        
                     
                     S1: begin
                           busy = 1'b1;					   
						   clr_k = 1'b1; 
						   clr_z = 1'b1;
						   clr_j = 1'b1;
						   
	                 end
					 S2: begin 
							enable_k = 1'b0;
							writeZ = 1'b0;
							clr_z = 1'b0;
							clr_j = 1'b0;
						end
					S3: begin 
							clr_z = 1'b1;
							clr_j = 1'b1;
						end
					S4: ;
                 	S5: begin 
							enable_j = 1'b0;
							enable_z = 1'b0;

						end
					S6: begin 
							enable_j = 1'b1;
							//clr_j = 1'b1;
							
						end
					//S10: writeZ <= 1'b1;
					S7: begin 
							writeZ = 1'b1;


						end
					S8: begin 
							enable_k = 1'b1;
							

					end
					S9: begin 
							enable_j = 1'b0;
							enable_z = 1'b1;
							

					end
					S10: done = 1'b1;
					
               
               endcase
            end
           end
             
       /*
	   ///(3) registered output logic (Moore outputs)
             always_ff @(posedge clk or negedge start) begin
               if(!start) begin
                  //com_k_until <= 1'b0;
                  //compj <= 1'b0;
                  clr_count <= 1'b0;
				  clr_z <= 1'b0;
                  writeZ <= 1'b0;
                  //shape <= 1'b0;
                  busy <= 1'b0;
                  done <= 1'b0;
                  enable_k <= 1'b0;
                  enable_j <= 1'b0;
                  enable_z <= 1'b0;
                  clr_j <= 1'b0;
                  clr_k <= 1'b0;
                  //clr_count <= 1'b0;
                  enable_count <= 1'b0;
               end
               else begin
              
                  case(state)
                     S0:begin
						 //com_k_until <= 1'b0;
						  //compj <= 1'b0;
						  clr_count <= 1'b0;
						  clr_z <= 1'b0;
						  writeZ <= 1'b0;
						  //shape <= 1'b0;
						  busy <= 1'b0;
						  done <= 1'b0;
						  enable_k <= 1'b0;
						  enable_j <= 1'b0;
						  enable_z <= 1'b0;
						  clr_j <= 1'b0;
						  clr_k <= 1'b0;
						  enable_count <= 1'b0;
                        end
                        
                     
                     S1: begin
                           busy <= 1'b1;					   
						   clr_k <= 1'b1; 
						   clr_z <= 1'b1;
						   clr_j <= 1'b1;
						   done <= 1'b1;
	                 end
					 S2: begin 
							enable_k <= 1'b0;
							writeZ <= 1'b0;
							clr_z <= 1'b0;
							clr_j <= 1'b0;
						end
					S3: begin 
							clr_z <= 1'b1;
							clr_j <= 1'b1;
						end
                 	 S5: begin 
							enable_j <= 1'b0;
							enable_z <= 1'b0;

						end
					S6: begin 
							enable_j <= 1'b1;
							clr_j <= 1'b1;
							
						end
					//S10: writeZ <= 1'b1;
					S7: begin 
							writeZ <= 1'b1;


						end
					S8: begin 
							enable_k <= 1'b1;
							

					end
					S9: begin 
							enable_j <= 1'b0;
							enable_z <= 1'b1;
							

					end
					
               
               endcase
            end
           end
             */

endmodule