class Transaction;
    rand bit [31:0] data;
    randc bit [2: 0] port;
endclass

// THIS METHOD OF INSTANTIATION DOESN'T WORK
// covergroup CovPort;
//     coverpoint tr.port;
//     coverpoint tr.data;
// endgroup

program c02_tb;
    covergroup CovPort;
        coverpoint tr.port;
        coverpoint tr.data;
    endgroup
    Transaction tr = new;
    CovPort ck = new;
    initial begin
        repeat(7) begin
            void'(tr.randomize);
            $display("tr.port: %0d, tr.data: %0d", tr.port, tr.data);
            ck.sample();
        end
    end
endprogram
