`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.05.2021 13:03:23
// Design Name: 
// Module Name: testbench_processor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench_processor(

    );

    reg clk=1'b0;
    initial
    begin
        while(1)
        begin
            #1 clk=1'b0;
            #1 clk=1'b1;
        end
    end
    
    processor test_processor(
        .clk(clk)
    );
endmodule
