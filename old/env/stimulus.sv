class packet;
    randc bit data;
    bit reset;
    string name;
    extern function new(string name = "packet");
endclass

function packet::new(string name = "packet");
    this.name = name;
endfunction

