program execute_test(intf_io execute);
    generator gen;
    driver drv;
    scoreboard sb;
    packet pkt2send;
    int number_packet;
    int packet_got = 0;
    reg [3:0] count_cmp;
    reg [3:0] temp;
    initial begin
        number_packet = 21;
        gen = new("gen", number_packet);
        sb = new();
        reset();
        drv = new("drv[0]", generator.in_box, sb.out_box, execute);
        gen.start();
        drv.start();
        fork
            recv();
        join
    end
endprogram

task reset();
    @(execute.tb);
    execute.cb.reset <= 1'b0;
    execute.cb.count <= 4'b0;
    @(execute.cb);
    execute.cb.reset <= 1'b1;
endtask

task recv();
    @(execute.cb);
    repeat (number_packet)
    begin
        @(execute.cb);
        get_payload();
        check();
    end
endtask

task get_payload();
    count_cmp = execute.cb.count;
endtask

task check();
    if(sb.out_box.num() != 0)
    begin
        sb.out_box.get(pkt2send);
        $display("get value from scoreboard pkt2send.data %d", pkt2send.data);
        sb.store = sb.store + pkt2send.data;
        $display("Time: %g, ns count_cmp: %b, my_count: %b", $time, count_cmp, sb.store);
    end
endtask
