`timescale 1ns / 1ps

module evm_tb();

reg clk;
reg btn;
reg start_vote;
reg [2:0] vote_input;
wire [2:0] party_led;
wire invalid_vote;
wire [6:0] total_votes;

evm uut (
    .clk(clk),
    .vote_input(vote_input),
    .start_vote(start_vote),
    .btn(btn),
    .party_led(party_led),
    .invalid_vote(invalid_vote),
    .total_votes(total_votes)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    start_vote = 0; vote_input = 3'b000; btn = 0;
    #10 start_vote = 1; vote_input = 3'b001; btn = 1;
    #10 btn = 0;
    #10 btn = 1;
    #10 btn = 0;
    #10 vote_input = 3'b010; btn = 1;
    #10 btn = 0;
    #10 btn = 1;
    #10 btn = 0;
    #10 vote_input = 3'b100; btn = 1;
    #10 btn = 0;
    #10 vote_input = 3'b011; btn = 1;
    #10 btn = 0;
end

endmodule
