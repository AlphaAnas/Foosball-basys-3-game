`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// // Engineer: Oguz Kaan Agac & Bora Ecer
// 
// Create Date: 14/12/2016
// Design Name: Controller
// Module Name: main_control
// Project Name: BASPONG
// Target Devices: BASYS3
// Description: 
// Controller for the BASPONG
// Dependencies: 
// clk_wiz
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_control(
    input logic clk,
    input logic start,   
    input logic reset,
    
    
//    input logic kb_clk, // will use this if necessary and assign a port to this => set_property PACKAGE_PIN C17 [get_ports kb_clk]
//    input logic kb_data, // the input from keyboard 
//    input logic right1_btn_u,
    input logic ps2d,
    input logic ps2c,
//    input logic right1_btn_d,
//    input logic left1_btn_u,
//    input logic left1_btn_d,
//    input logic left2_btn_u,
//    input logic left2_btn_d,
//    input logic right2_btn_d,
//    input logic right2_btn_u,
//    input logic start_ball,
//    output logic [2:0] rgb,
    input logic screen,
    output logic [3:0] red,
    output logic [3:0] blue,
    output logic [3:0] green,
    output logic dir,
    output logic horizontal_sync,
    output logic vertical_sync,
    output logic batti1,
    output logic batti2,
    
    output a, b, c, d, e, f, g, dp,
                     output [3:0] an  ); 

reg score_checker1;
reg score_checker2;
reg [3:0] player1_score;
reg [3:0] player2_score;
//wire reset;
initial 
    begin : process_0
    player1_score = 'b0000;   
    player2_score = 'b0000;
    score_checker1 = 0;
    score_checker2 = 0;
    end

//signal x,y:std_logic_vector(9 downto 0);
reg[9:0] x_control;
reg[9:0] y_control;

//signal video:std_logic;
reg video_on;

//signal clk_50 :std_logic;
reg clk_50;
wire to_be_changed_var;

reg state;

reg [3:0] red_reg;
reg [3:0] blue_reg;
reg [3:0] green_reg;

//Vivado CLK wizzard to create 50MHz clock 
clk_wiz_0(clk_50, reset, clk);

//keyboard_burhan kb(clk, kb_clk, kb_data, dir, to_be_changed_var, led);
keyboard_1(
    .clk(clk_50), 
    .reset(reset),
    .ps2d(ps2d), 
    .ps2c(ps2c),
    .start_ball(start_ball), 
    .KEY_UP_4(KEY_UP_4), 
    .KEY_DOWN_4(KEY_DOWN_4), 
    .KEY_UP_3(KEY_UP_3), 
    .KEY_DOWN_3(KEY_DOWN_3),
    .KEY_UP_2(KEY_UP_2), 
    .KEY_DOWN_2(KEY_DOWN_2), 
    .KEY_UP_1(KEY_UP_1), 
    .KEY_DOWN_1(KEY_DOWN_1),
    .state(state),
    .key_release(key_release)
);

//handfootball_game_keyboard(clk_50, DATA, right1_btn_u, right1_btn_d, right2_btn_d,  right2_btn_u, left1_btn_u, left1_btn_d, left2_btn_u, left2_btn_d, reset);
reg [3:0] red1;
reg [3:0] blue1;
reg [3:0] green1;

reg [2:0] rgb;

//pixel_gen pg(clk_25,clk_50,x_loc,y_loc,video_on,red1,green1,blue1);   

//pixel_gen pg(clk_50,x_loc,y_loc,video_on,red1,green1,blue1);   

anim_gen(clk_50, reset, x_control, start_ball, KEY_UP_4, KEY_DOWN_4, KEY_DOWN_3,  KEY_UP_3, KEY_UP_1, KEY_DOWN_1, KEY_UP_2, KEY_DOWN_2, y_control, video_on, rgb, score_checker1, score_checker2);

//vga synchronization module to update changing pixels and refresh the display
sync_mod(clk_50, reset, start, y_control, x_control, horizontal_sync, vertical_sync, video_on);


//if score checker1 is enabled that means player 1(topbar) scored, so update  his score
always_ff @(posedge clk_50, posedge reset)
begin
    if (player1_score == 9 || reset == 1)
        player1_score <= 0;
    else if (score_checker1 == 1)
        player1_score++;
end

//if score checker2 is enabled that means player2 (bottom bar) scored, so update his score
always_ff @(posedge clk_50, posedge reset)
begin
    if (player2_score == 9 || reset == 1)
        player2_score <= 0;
    else if (score_checker2 == 1)
        player2_score++;
end 

assign red = state == 0 ? red1 : {rgb[2], rgb[2], rgb[2], rgb[2]};
assign green = state == 0 ? green1 : {rgb[1], rgb[1], rgb[1], rgb[1]};
assign blue = state == 0 ? blue1 : {rgb[0], rgb[0], rgb[0], rgb[0]};

//always_ff @(posedge clk_50)
//begin
//    if (screen == 0) begin
//        red_reg<=red1;
//        blue_reg<=blue1;
//        green_reg<=green1;
//        batti1 <= 1;
//        batti2 <= 0;
//    end
//    else if (screen == 1) begin
//        red_reg<=rgb[2];
//        blue_reg<=rgb[0];
//        green_reg<=rgb[1];
//        batti2 <= 1;
//        batti1 <= 0;
//    end
//end

//initial 
//    begin
//        red = red_reg;
//        green = green_reg;
//        blue = blue_reg;
//    end


//Module to display the scores on the 7seg display of basys3
SevenSegment(clk_50,player1_score,'b0000,'b0000,player2_score,a, b, c, d, e, f, g, dp,an);

endmodule
