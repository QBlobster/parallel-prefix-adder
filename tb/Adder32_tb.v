`timescale 1ns/1ps

module adder32_tb;
    parameter DATA_WIDTH = 31;
    reg [DATA_WIDTH:0]a,b;
    reg cin;
    wire [DATA_WIDTH:0]s;
    wire cout;

    adder32 #(.DATA_WIDTH(DATA_WIDTH)) adder32_0(
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial
    begin
        $dumpfile("./func/Adder32.fsdb");
        $dumpvars(0, adder32_0);
        $monitor($realtime, "\ta = %b, b = %b, cin = %b, s = %b \n\ta = %d, b = %d, cin = %d, s = %d", 
        a, b, cin, s, a, b, cin, s);
        #2480 $finish;
    end
    
    initial
    begin
        a = 1;
        b = 0;
        cin = 0;
        forever 
        begin
            #40 a = a * 2 - (b + 1);
            #40 a = a + 1;
        end
    end
    
endmodule