`timescale 1ns / 1ps

module evm (
    input wire clk,
    input wire [2:0] vote_input,
    input wire start_vote,
    input wire btn,
    output reg [2:0] party_led,
    output reg invalid_vote,
    output wire [6:0] total_votes
);

// Voting counters
reg [6:0] party1_votes = 0;
reg [6:0] party2_votes = 0;
reg [6:0] party3_votes = 0;
reg [6:0] next_party1_votes = 0;
reg [6:0] next_party2_votes = 0;
reg [6:0] next_party3_votes = 0;

// Button debouncing
reg btn_reg1;
reg btn_reg2;
reg [15:0] btn_cnt = 0;
reg btn_state = 0;
wire btn_idle = (btn_state == btn_reg2);
wire btn_cnt_max = &btn_cnt;
wire btn_press;

always @(posedge clk) begin
    btn_reg1 <= btn;
    btn_reg2 <= btn_reg1;
end

always @(posedge clk) begin
    if (btn_idle)
        btn_cnt <= 0;
    else begin
        btn_cnt <= btn_cnt + 16'd1;
        if (btn_cnt_max)
            btn_state <= ~btn_state;
    end
end

assign btn_press = ~btn_idle & btn_cnt_max & ~btn_state;

// Party vote counters
always @(posedge btn_press) begin
    if (vote_input == 3'b001 && start_vote)
        party1_votes <= next_party1_votes;
    else if (vote_input == 3'b010 && start_vote)
        party2_votes <= next_party2_votes;
    else if (vote_input == 3'b100 && start_vote)
        party3_votes <= next_party3_votes;
end

always @(*) begin
    next_party1_votes = party1_votes + 1;
    next_party2_votes = party2_votes + 1;
    next_party3_votes = party3_votes + 1;
end

// Total votes
assign total_votes = party1_votes + party2_votes + party3_votes;

// Vote validation and LED control
always @(*) begin
    if (start_vote) begin
        case (vote_input)
            3'b001: begin
                party_led = 3'b001;
                invalid_vote = 1'b0;
            end
            3'b010: begin
                party_led = 3'b010;
                invalid_vote = 1'b0;
            end
            3'b100: begin
                party_led = 3'b100;
                invalid_vote = 1'b0;
            end
            default: begin
                party_led = 3'b000;
                invalid_vote = 1'b1;
            end
        endcase
    end else begin
        party_led = 3'b000;
        invalid_vote = 1'b0;
    end
end

endmodule
