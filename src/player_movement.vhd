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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
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

        player_action_ready : out std_logic
    );
end player_movement;

architecture Behavioral of player_movement is

    -- player position internals
    signal in_player_x : SIGNED(10 downto 0) := "00100101100"; -- 300
    signal in_player_y : SIGNED(10 downto 0) := "00100101100"; -- 300
    signal in_player_action : SIGNED(2 downto 0) := "000";

    -- player action
    signal player_action_counter : UNSIGNED(27 downto 0) := (others => '0');
    constant player_action_counter_max : UNSIGNED(27 downto 0) := to_unsigned(250000000, 28);
    signal in_player_action_ready : std_logic := '1';

    -- player movement area boundaries
    constant player_x_lower_bound : SIGNED(10 downto 0) := "00011001000"; --200 
    constant player_x_upper_bound : SIGNED(10 downto 0) := "01001011000"; --600 
    constant player_y_lower_bound : SIGNED(10 downto 0) := "00001100100"; --100
    constant player_y_upper_bound : SIGNED(10 downto 0) := "00111110100"; --500
    
    constant dash_distance : SIGNED(6 downto 0) := "0110010"; -- 50


begin

    process_mouse_movement : process(clk50, DataRdy)
    begin
    
      if rising_edge(clk50) then 
         if in_player_action_ready = '1' then
            if in_player_action(0) = '1' then --left click
               in_player_x <= in_player_x - dash_distance;
               in_player_action_ready <= '0';
            end if;
            
            if in_player_action(1) = '1' then -- right click
               in_player_x <= in_player_x + dash_distance;
               in_player_action_ready <= '0';
            end if;
            
            if in_player_action(2) = '1' then -- mouse3 click
               in_player_y <= in_player_y - dash_distance;
               in_player_action_ready <= '0';
            end if;
         else
				-- player action not ready - loading logic
            player_action_counter <= player_action_counter + 1;

            if player_action_counter = player_action_counter_max then
                player_action_counter <= to_unsigned(0, 28);
                in_player_action_ready <= '1';
            end if;    
                     
         end if;
    
        if DataRdy = '1' then
            -- Apply mouse movement deltas to temp variables
            in_player_x <= in_player_x + signed(B2_X);
            in_player_y <= in_player_y - signed(B3_Y);

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
     end if;

    end process process_mouse_movement;

    process_button_status : process(clk50, DataRdy, B1_Status)
    begin
        if DataRdy = '1' and rising_edge(clk50) then
            
            in_player_action(0) <= B1_Status(0);
            in_player_action(1) <= B1_Status(1);
            in_player_action(2) <= B1_Status(2);

        end if;    
    end process process_button_status;  
 
    -- output internals
    player_x <= std_logic_vector(in_player_x);
    player_y <= std_logic_vector(in_player_y);
    
    player_action_ready <= in_player_action_ready;

end Behavioral;

