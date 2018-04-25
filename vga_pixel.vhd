----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:45:58 04/12/2018 
-- Design Name: 
-- Module Name:    vga_pixel - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_pixel is
   Port (
        h_counter: in std_logic_vector(10 downto 0);
        v_counter: in std_logic_vector(10 downto 0);
        vidon : in std_logic;
        
        player_x : in std_logic_vector(10 downto 0);
        player_y : in std_logic_vector(10 downto 0);
        player_action : in std_logic;

        red_out: out std_logic;
        green_out: out std_logic;
        blue_out: out std_logic
    );
end vga_pixel;

architecture Behavioral of vga_pixel is
    constant player_size : std_logic_vector(10 downto 0) := 30;
begin

 draw_display_area : process(vidon, h_counter, v_counter)
    begin
        red_out <= '0';
        green_out <= '0';
        blue_out <= '0';

        if vidon = '1' then
            -- if h_counter > 100 and h_counter < 200 then
            --    if v_counter > 100 and v_counter < 200 then
             
            --       green_out <= '1';
            --    end if;
            -- end if;
        
            if h_counter > player_x and h_counter < player_x + player_size then
                if v_counter > player_y and v_counter < player_y + player_size then
                    
                    if player_action = '1' then
                        red_out <= '1';
                    else
                        green_out <= '1';
                    end if;

                end if;
            end if;

        end if;
    end process draw_display_area;

end Behavioral;

