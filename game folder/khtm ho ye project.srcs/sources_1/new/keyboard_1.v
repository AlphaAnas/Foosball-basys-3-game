`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2023 05:15:57 PM
// Design Name: 
// Module Name: keyboard_1
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


module keyboard_1(
    input wire clk, reset,
    input wire ps2d, ps2c,
    output wire start_ball, KEY_UP_4, KEY_DOWN_4, KEY_UP_3, KEY_DOWN_3, KEY_UP_2, KEY_DOWN_2, KEY_UP_1, KEY_DOWN_1,
    output reg key_release,
    output  reg state
    );

// Declare variables
wire [7:0] dout;
wire rx_done_tick;
supply1 rx_en; // always HIGH
reg [7:0] key;


 
// Instantiate models
// Nexys4 converts USB to PS2, we grab that data with this module
ps2_rx ps2(clk, 
, ps2d, ps2c, 
            rx_en, rx_done_tick, dout);
 
// Sequential logic
always @(posedge clk)
begin
    if (rx_done_tick)
    begin 
        key <= dout; // key is one rx cycle behind dout
        if (key == 8'hf0) // check if the key has been released
            key_release <= 1'b1;
        else
            key_release <= 1'b0;
    end
end
 
// Output control keys of interest
//assign reset = ((key == 8'h2D) & !key_release) ? ~reset : reset; // 1C is the code for 'R'
assign start_ball = (key == 8'h29) & !key_release; // 1C is the code for 'Space Bar'
assign KEY_UP_4 = (key == 8'h4D) & !key_release; // 1C is the code for 'P'
assign KEY_DOWN_4 = (key == 8'h4B) & !key_release; // 1F is the code for 'L'
assign KEY_UP_3 = (key == 8'h44) & !key_release; // 20 is the code for 'O'
assign KEY_DOWN_3 = (key == 8'h42) & !key_release; // 32 is the code for 'K' 
assign KEY_UP_2 = (key == 8'h1D) & !key_release; // 1C is the code for 'W'
assign KEY_DOWN_2 = (key == 8'h1B) & !key_release; // 1F is the code for 'S'
assign KEY_UP_1 = (key == 8'h15) & !key_release; // 20 is the code for 'Q'
assign KEY_DOWN_1 = (key == 8'h1C) & !key_release; // 32 is the code for 'A'
 
always @(posedge clk ) begin
     begin
        // Check if the key is pressed and assign the state accordingly
        case(key)
            8'h5A : state <= 1'b1; // Set state to 1 when Enter key is pressed
            8'h66 : state <= 1'b0; // Set state to 0 when Backspace key is pressed
            default: state <= state; // Maintain state otherwise
        endcase
    end
end


endmodule
