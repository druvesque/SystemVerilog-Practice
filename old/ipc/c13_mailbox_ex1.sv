module c13_tb;
    typedef mailbox #(string) s_mbox;
    string s;
    s_mbox sm;
    initial begin
        sm = new();
        sm.put("work");
        sm.put("hello");
        sm.put("bye");
        sm.get(s);
        $display(s);
        sm.get(s);
        $display(s);
    end
endmodule
