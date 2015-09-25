`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:02:42 08/18/2015 
// Design Name: 
// Module Name:    up_cnt 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module down_cnt(
    clk,
	 rst_n,
	 out0,
	 out1	 
);

output [3:0]out0,out1;
input clk,rst_n;

reg [3:0]out0,out1;
reg [3:0]next_out0,next_out1;

always@(posedge clk or negedge rst_n)
	if(~rst_n) begin
		out0 <= 4'd0;
		out1 <= 4'd3;
	end
	else begin
		out0 <= next_out0;
		out1 <= next_out1;
	end
	
always@(*)
	if(out1==4'd0 && out0==4'd0) begin
		next_out0 = 4'd0;
		next_out1 = 4'd0;
	end
	else if(out1!=4'd0 && out0==4'd0) begin
		next_out0 = 4'd9;
		next_out1 = out1 - 4'd1;
	end
	else begin
		next_out0 = out0 - 4'd1;
		next_out1 = out1;
	end

endmodule
