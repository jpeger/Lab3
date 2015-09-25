`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:07:48 08/18/2015 
// Design Name: 
// Module Name:    lab3 
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
module lab3(
	clk,
	rst_n,
	ftseg,
	ftsd_ctl,
	led	
);

input clk,rst_n;
output [15:0]led;
output [14:0]ftseg;
output [3:0]ftsd_ctl;

wire [3:0]bcd;
wire [25:0]cnt;
wire [3:0]sec0,sec1,min0,min1;

assign led = (cnt[25])? 16'b1111_1111_1111_1111 : 16'd0;

freq_div U0(
	.clk(clk),
	.rst_n(rst_n),
	.cnt(cnt)
);

up_cnt U1(
    .clk(cnt[24]),
	 .rst_n(rst_n),
	 .out0(sec0),
	 .out1(sec1)	 
);

down_cnt U2(
    .clk(cnt[24]),
	 .rst_n(rst_n),
	 .out0(min0),
	 .out1(min1)	 
);

scan_ctl U3(
	.ftsd_ctl(ftsd_ctl),
	.ftsd_in(bcd),
	.in0(sec0),
	.in1(sec1),
	.in2(min0),
	.in3(min1),
	.ftsd_ctl_en(cnt[15:14])
);

bcd2ftsegdec U4(
	.display(ftseg),
	.bcd(bcd)
);


endmodule
