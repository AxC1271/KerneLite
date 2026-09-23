module register_file (
    input  logic clk,
    input  logic rst_n,

    // read ports
    input  logic[4:0]  rd_addr1,
    input  logic[4:0]  rd_addr2,
    output logic[31:0] rd_data1,
    output logic[31:0] rd_data2,

    // write ports
    input  logic[4:0]  wr_addr,
    input  logic[31:0] wr_data,
    input  logic       reg_write
);

    logic[31:0] regs [0:31];

    // since the architecture is just a single-cycle processor 
    // no need to do register/bypass forwarding
    assign rd_data1 = regs[rd_addr1];
    assign rd_data2 = regs[rd_addr2];

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            for (int i = 0; i < 32; i++) begin
                regs[i] <= 32'b0;
            end else if (reg_write) begin
                regs[wr_addr] <= wr_data;
            end
        end
    end 

endmodule