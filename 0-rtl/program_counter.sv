module program_counter (
    input  logic clk,
    input  logic rst_n,
    input  logic pc_in,
    output logic pc_out
);

    always_ff @(posedge clk) begin
        if (!rst_n) begin
            pc_out <= '0;
        end else begin
            pc_out <= pc_in;
        end
    end
endmodule