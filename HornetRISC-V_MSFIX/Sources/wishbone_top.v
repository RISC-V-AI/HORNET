`timescale 1ns / 1ps

module wb_top (
        input clk_i,
        input reset_i,
        input meip_i,
        input [15:0] fast_irq_i,
        output irq_ack_o
    );
    
    
    //Wishbone interface for data memory
    wire        data_wb_cyc_o;
    wire        data_wb_stb_o;
    wire        data_wb_we_o;
    wire [31:0] data_wb_adr_o;
    wire [31:0] data_wb_dat_o;
    wire [3:0]  data_wb_sel_o;
    wire        data_wb_stall_i;
    wire        data_wb_ack_i;
    wire [31:0]  data_wb_dat_i;
    wire        data_wb_err_i;
    wire        data_wb_rst_i;
    wire        data_wb_clk_i;
    
    //Wishbone interface for instruction memory
    wire        inst_wb_cyc_o;
    wire        inst_wb_stb_o;
    wire        inst_wb_we_o;
    wire [31:0] inst_wb_adr_o;
    wire [31:0] inst_wb_dat_o;
    wire [3:0]  inst_wb_sel_o;
    //input         inst_wb_stall_i, //Unused
    //input         inst_wb_ack_i,  //Unused
    wire [31:0]  inst_wb_dat_i;
    wire         inst_wb_err_i;
    //input         inst_wb_rst_i, //Unused
    //input         inst_wb_clk_i, //Unused
    
    wire mtip;
    
    
    
wb_master wb_master0(
    .reset_i(reset_i),
    .clk_i(clk_i),
    .data_wb_cyc_o(data_wb_cyc_o),  
    .data_wb_stb_o(data_wb_stb_o),  
    .data_wb_we_o(data_wb_we_o),   
    .data_wb_adr_o(data_wb_adr_o),  
    .data_wb_dat_o(data_wb_dat_o),  
    .data_wb_sel_o(data_wb_sel_o),  
    .data_wb_stall_i(data_wb_stall_i),
    .data_wb_ack_i(data_wb_ack_i),  
    .data_wb_dat_i(data_wb_dat_i),  
    .data_wb_err_i(data_wb_err_i),  
    .data_wb_rst_i(data_wb_rst_i),  
    .data_wb_clk_i(data_wb_clk_i),
    .inst_wb_cyc_o(inst_wb_cyc_o),
    .inst_wb_stb_o(inst_wb_stb_o),
    .inst_wb_we_o(inst_wb_we_o), 
    .inst_wb_adr_o(inst_wb_adr_o),
    .inst_wb_dat_o(inst_wb_dat_o),
    .inst_wb_sel_o(inst_wb_sel_o),
    .inst_wb_dat_i(inst_wb_dat_i),
    .inst_wb_err_i(inst_wb_err_i),  
    .meip_i(meip_i),           
    .mtip_i(mtip),           
    .msip_i(1'b0),
    .fast_irq_i(fast_irq_i),
    .irq_ack_o(irq_ack_o)
    ); 
    
wb_slave wb_slave0 (
    .reset_i(reset_i),
    .clk_i(clk_i),
    .data_wb_cyc_o(data_wb_cyc_o),  
    .data_wb_stb_o(data_wb_stb_o),  
    .data_wb_we_o(data_wb_we_o),   
    .data_wb_adr_o(data_wb_adr_o),  
    .data_wb_dat_o(data_wb_dat_o),  
    .data_wb_sel_o(data_wb_sel_o),  
    .data_wb_stall_i(data_wb_stall_i),
    .data_wb_ack_i(data_wb_ack_i),  
    .data_wb_dat_i(data_wb_dat_i),  
    .data_wb_err_i(data_wb_err_i),  
    .data_wb_rst_i(data_wb_rst_i),  
    .data_wb_clk_i(data_wb_clk_i),
    .inst_wb_cyc_o(inst_wb_cyc_o),
    .inst_wb_stb_o(inst_wb_stb_o),
    .inst_wb_we_o(inst_wb_we_o), 
    .inst_wb_adr_o(inst_wb_adr_o),
    .inst_wb_dat_o(inst_wb_dat_o),
    .inst_wb_sel_o(inst_wb_sel_o),
    .inst_wb_dat_i(inst_wb_dat_i),
    .inst_wb_err_i(inst_wb_err_i),
    .mtip(mtip)
    );    
    
endmodule
