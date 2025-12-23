module example18;
    int j = 1, b[$] = {3, 4}, q[$] = {0, 2, 5}, c[] = {10, 15, 20};
    initial begin
        q.insert(1, j);
        // q.insert(2, b);  Can't insert a queue in another queue
        q = {q, b};
        $display("q: %p", q);
        q = {q, c};
        q.delete(1);
        $display("q: %p", q);
        q.push_front(6);
        $display("q: %p", q);
        j = q.pop_back;
        $display("j: %0d, q: %p", j, q);
        q.push_back(8);
        $display("q: %p", q);
        j = q.pop_front;
        $display("j: %0d, q: %p", j, q);
    end
endmodule
