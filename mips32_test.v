`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.09.2025 22:21:05
// Design Name: 
// Module Name: mips32_test
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

module test_mips32;
reg clk1, clk2;
integer k;
mips32_pipeline mips (clk1, clk2);
// Clock Generation (Continuous)
initial begin
    clk1 = 0;
    clk2 = 0;
end
always #5 clk1 = ~clk1;   // clk1 period = 10ns
always #5 clk2 = ~clk2;   // clk2 period = 10ns (can phase shift if required)
// Program and Initialization
initial begin
    for (k=0; k<31; k=k+1)
        mips.Reg[k] = k;
    mips.Mem[0] = 32'h2801000a;    // ADDI  R1,R0,10
    mips.Mem[1] = 32'h28020014;    // ADDI  R2,R0,20
    mips.Mem[2] = 32'h28030019;    // ADDI  R3,R0,25
    mips.Mem[3] = 32'h0ce77800;    // OR    R7,R7,R7
    mips.Mem[4] = 32'h0ce77800;    // OR    R7,R7,R7
    mips.Mem[5] = 32'h00222000;    // ADD   R4,R1,R2
    mips.Mem[6] = 32'h0ce77800;    // OR    R7,R7,R7
    mips.Mem[7] = 32'h00832800;    // ADD   R5,R4,R3
    mips.Mem[8] = 32'hfc000000;    // HLT
    mips.HALTED = 0;
    mips.PC = 0;
    mips.TAKEN_BRANCH = 0;
    #1800
    for (k=0; k<6; k=k+1)
        $display ("R%1d - %2d", k, mips.Reg[k]);
end
// Dump VCD for GTKWave / Vivado
initial begin
    $dumpfile ("mips.vcd");
    $dumpvars (0, test_mips32);
    #2000 $finish;     // Give enough time for pipeline to execute
end
endmodule