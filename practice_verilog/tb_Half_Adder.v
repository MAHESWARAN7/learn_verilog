`timescale 1ns / 1ps

module tb_half_adder();
    reg a;
    reg b;
    wire sum;
    wire carry;

    // Connect the testbench to your hardware
    half_adder uut (.a(a), .b(b), .sum(sum), .carry(carry));

  
    initial begin
        $dumpfile("waves.vcd");       // Tells it to create this file
        $dumpvars(0, tb_half_adder);  // Tells it to record everything
    end

    initial begin
        $monitor("Time=%0t | a=%b, b=%b | sum=%b, carry=%b", $time, a, b, sum, carry);
        $monitor("verilog");
    end

    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end
endmodule