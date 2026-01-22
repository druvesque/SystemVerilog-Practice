class generator;
    string name;
    packet pkt2send;
    typdef mailbox #(packet) in_box_type;
    in_box_type in_box = new();
    int packet_number;
    int number_packet;
    extern function new(string name = "generator", int number_packet);
    extern virtual task start();
endclass

function generator::new(string name = "generator", int number_packet);
    this.name = name;
    this.packet_number = 0;
    this.number_packet = number_packet;
endfunction

task generator::start();
    fork
        for (int i = 0; i < number_packet; i++)
        begin
            pkt2send = new();
            pkt2send.name = $psprintf("packet[%0d]", packet_number++);
            $display("in generator in_box.num %d %s pkt2send.name", in_box.num(), pkt2send.name);
            if (pkt2send.randomize()) begin
                $display("%d data randomize reset is %d", pkt2send.data, pkt2send.reset);
                in_box.put(pkt2send);
                $display("in_box.num %d", in_box.num());
            end
        end
    join_none
endtask

