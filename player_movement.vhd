----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:45:58 04/12/2018 
-- Design Name: 
-- Module Name:    player_movement - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity player_movement is
   Port (
        clk50 : in std_logic;

        DataRdy : in std_logic;
        B1_Status : in std_logic_vector(7 downto 0);
        B2_X : in std_logic_vector(7 downto 0);
        B3_Y : in std_logic_vector(7 downto 0);

        player_x : out std_logic_vector(10 downto 0);
        player_y : out std_logic_vector(10 downto 0);
        player_action : out std_logic
    );
end player_movement;

architecture Behavioral of player_movement is

    -- player position internals
    signal in_player_x : std_logic_vector(10 downto 0) := "00100101100"; -- 300
    signal in_player_y : std_logic_vector(10 downto 0) := "00100101100"; -- 300
    signal in_player_action : std_logic := '0';

    -- player movement area boundaries
    constant player_x_lower_bound : std_logic_vector(10 downto 0) := "00011001000"; --200 
    constant player_x_upper_bound : std_logic_vector(10 downto 0) := "01001011000"; --600 
    constant player_y_lower_bound : std_logic_vector(10 downto 0) := "00001100100"; --100
    constant player_y_upper_bound : std_logic_vector(10 downto 0) := "00111110100"; --500

begin

    process_mouse_movement : process(clk50, DataRdy)
    begin
        if DataRdy = '1' and rising_edge(clk50) then
            -- Apply mouse movement deltas
            in_player_x <= std_logic_vector(signed(in_player_x) + signed(B2_X));
            in_player_y <= std_logic_vector(signed(in_player_y) - signed(B3_Y));
            
            -- Keep the player in horizontal boundaries
            if in_player_x < player_x_lower_bound then
                in_player_x <= player_x_lower_bound;
            elsif in_player_x > player_x_upper_bound then
                in_player_x <= player_x_upper_bound;
            end if;

            -- Keep the player in vertical boundaries
            if in_player_y < player_y_lower_bound then
                in_player_y <= player_y_lower_bound;
            elsif in_player_y > player_y_upper_bound then
                in_player_y <= player_y_upper_bound;
            end if;
                
        end if;

    end process process_mouse_movement;

    process_button_status : process(clk50, DataRdy, B1_Status)
    begin
        if DataRdy = '1' and rising_edge(clk50) then
            in_player_action <= B1_Status(0);
        end if;    
    end process process_button_status;  
 
    -- output internals
    player_x <= in_player_x;
    player_y <= in_player_y;
    player_action <= in_player_action;

end Behavioral;

