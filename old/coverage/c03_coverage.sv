class Transaction;
    rand bit [31:0] data;
    rand bit [2:0] port;
endclass

program c03_tb;
    covergroup CovPort;
        coverpoint tr.port {
            option.auto_bin_max = 10;
        }
    endgroup
    Transaction tr = new;
    CovPort ck = new;
    initial begin
        repeat(32) begin
            void'(tr.randomize);
            $display(tr.port, tr.data);
            ck.sample();
        end
    end
endprogram
