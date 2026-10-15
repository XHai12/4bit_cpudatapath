`timescale 1ns / 1ps

module tb_add_sub_4bit;
    // Khai báo biến tương ứng với port của module
    reg [3:0] a;
    reg [3:0] b;
    reg sub;
    wire [3:0] sum;
    wire c3;
    wire c4;
    wire overflow;

    // Gọi (instantiate) module bạn vừa viết
    adder_subtractor_4bit uut (
        .a(a),
        .b(b),
        .sub(sub),
        .sum(sum),
        .c3(c3),
        .c4(c4),
        .overflow(overflow) // Kết nối trực tiếp vào chân overflow đã tạo
    );

    initial begin
        // Bắt buộc in Tên và Roll Number theo barem B
        $display("Name: Bui Xuan Hai, Roll Number: HE200952");

        // Part 1: Addition (sub = 0)
        $display("--- Part 1: Addition ---");
        sub = 0; a = 4'b0011; b = 4'b0010; #10; // 3 + 2 = 5
        if (sum !== 4'b0101) $display("Loi tai Part 1: 3 + 2");
        
        sub = 0; a = 4'b0111; b = 4'b0001; #10; // 7 + 1 = 8 (Tràn số)
        if (sum !== 4'b1000 || overflow !== 1) $display("Loi tai Part 1: 7 + 1");

        // Part 2: Subtraction (sub = 1)
        $display("--- Part 2: Subtraction ---");
        sub = 1; a = 4'b0111; b = 4'b0010; #10; // 7 - 2 = 5
        if (sum !== 4'b0101) $display("Loi tai Part 2: 7 - 2");
        
        sub = 1; a = 4'b1000; b = 4'b0001; #10; // -8 - 1 = 7 (Tràn số)
        if (sum !== 4'b0111 || overflow !== 1) $display("Loi tai Part 2: -8 - 1");

        // Bắt buộc kết thúc bằng dòng PASS theo barem B
        $display("PASS");
        $finish;
    end
endmodule