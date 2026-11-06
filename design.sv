module seu_system(
    input logic clk, rst, fault,
    input logic [7:0] data_in,
    output logic [7:0] data_out,
    output logic error
);

    logic [7:0] r1, r2, r3;

    assign data_out = (r1 & r2) | (r2 & r3) | (r1 & r3);
    assign error = (r1 != r2) || (r2 != r3);

    always_ff @(posedge clk) begin
    if (rst) begin
        r1 <= 0;
        r2 <= 0;
        r3 <= 0;
    end
    else if (fault) begin
        r2[3] <= ~r2[3];
    end
    else if (error) begin
        r1 <= data_out;
        r2 <= data_out;
        r3 <= data_out;
    end
    else begin
        r1 <= data_in;
        r2 <= data_in;
        r3 <= data_in;
    end
end

endmodule