interface intf_io(input bit clock);
    logic data;
    logic reset;
    logic [3:0] count;

    clocking cb @(posedge clock)
        output reset;
        output data;
        input count;
    endclocking
endinterface
