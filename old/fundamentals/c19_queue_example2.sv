module example19; 
    integer queue[$] = {0, 1, 2, 3, 4};
    integer i;
    
    task print_queue;
        integer i;
        $write("Queue contains: ");
        for (i = 0; i < queue.size(); i++) begin
            $write(" %g", queue[i]);
        end
        $write("\n");
    endtask

    initial begin
        $display("Initial value of queue");
        print_queue;
        queue = {5, queue};
        $display("New element added using concatenation");
        print_queue;
        queue.push_front(6);
        $display("Use push_front to add new element.");
        print_queue;
        queue.push_back(7);
        $display("Use push_back to add new element");
        print_queue;
        queue.insert(1, 8);
        $display("Use insert(index, value) to add new val");
        print_queue;
        i = queue.pop_front();
        $display("element popped using pop_front");
        print_queue;
        i = queue.pop_back();
        $display("element popped using pop_end");
        print_queue;
        queue.delete(4);
        $display("deleted element at index 4");
        print_queue;
        #1 $finish;
    end
endmodule
