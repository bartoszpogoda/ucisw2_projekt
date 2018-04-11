library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_pixel is 
    Port (
        h_counter: in std_logic_vector(9 downto 0);
        v_counter: in std_logic_vector(9 downto 0);
        vidon : in std_logic;

        red_out: out std_logic;
        green_out: out std_logic;
        blue_out: out std_logic
    );
end vga_pixel;

architecture vga_pixel of vga_pixel is
begin

    process(vidon, h_counter, v_counter)
    begin
        red_out <= '0';
        green_out <= '0';
        blue_out <= '0';

        if vidon = '1' then
            red_out <= '1';
            green_out <= '1';
        end if;
    end process;
end vga_pixel;