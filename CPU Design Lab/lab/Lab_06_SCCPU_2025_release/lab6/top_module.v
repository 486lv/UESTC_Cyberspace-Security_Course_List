`timescale 1ns / 1ps

module top_module(
    // 时钟和复位信号
    input clk,
    input resetn,
    // IO 信号
    input [7:0] IO_Switch,
    input [3:0] IO_PB,
    output reg [7:0] IO_LED,
    output reg [7:0] IO_7SEGEN_N,
    output reg [31:0] IO_7SEG_DATA,
    // 指令存储器接口
    output [31:0] imem_addr,
    input [31:0] imem_rdata,
    // 数据存储器接口
    output [31:0] dmem_addr,
    output [31:0] dmem_wdata,
    output reg dmem_we
);

    // 单周期 CPU 模块
    sccpu_dataflow cpu (
        .clk(clk),
        .resetn(resetn),
        .imem_addr(imem_addr),
        .imem_rdata(imem_rdata),
        .dmem_addr(dmem_addr),
        .dmem_wdata(dmem_wdata),
        .dmem_we(dmem_we),
        .dmem_rdata(dmem_rdata)
    );

    // 指令存储器模块
    scinstmem imem (
        .addr(imem_addr),
        .rdata(imem_rdata)
    );

    // 数据存储器模块
    scdatamem dmem (
        .addr(dmem_addr),
        .wdata(dmem_wdata),
        .we(dmem_we),
        .rdata(dmem_rdata)
    );

    // 映射 IO 模块
    mapped_io_data io (
        .clk(clk),
        .datain(dmem_wdata),
        .dataout(dmem_rdata),
        .addr(dmem_addr),
        .we(dmem_we),
        .inclk(clk),
        .outclk(clk),
        .IO_Switch(IO_Switch),
        .IO_PB(IO_PB),
        .IO_LED(IO_LED),
        .IO_7SEGEN_N(IO_7SEGEN_N),
        .IO_7SEG_DATA(IO_7SEG_DATA)
    );

endmodule

