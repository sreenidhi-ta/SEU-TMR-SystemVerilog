module tb;
    logic clk=0, rst=1, fault=0;
    logic [7:0] data_in=8'b10110110;
    logic [7:0] data_out;
    logic error;

    seu_system dut(clk,rst,fault,data_in,data_out,error);

    always #5 clk=~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        #10 rst=0;
        #10;
        $display("NORMAL: error=%b",error);

        fault=1;
        #10 fault=0;
        #1;
        $display("FAULT: error=%b",error);

        #9;
        #1;
        $display("RECOVERED: output=%b error=%b",data_out,error);

        $finish;
    end
endmodule