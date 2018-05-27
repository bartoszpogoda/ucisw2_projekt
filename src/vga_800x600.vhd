----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:26:08 04/12/2018 
-- Design Name: 
-- Module Name:    vga_800x600 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_800x600 is
    Port ( clk50 : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           h_sync : out  STD_LOGIC;
           v_sync : out  STD_LOGIC;
           h_counter : out  STD_LOGIC_VECTOR (10 downto 0);
           v_counter : out  STD_LOGIC_VECTOR (10 downto 0);
           vidon : out  STD_LOGIC);
end vga_800x600;

architecture Behavioral of vga_800x600 is

	 -- breakpoint values with porches applied
    constant H_pixels : std_logic_vector(10 downto 0) := "10000010000"; -- 1040 (64 + 120 + 800 + 56)   
    constant H_before_sync :std_logic_vector(10 downto 0) := "01101011000"; --(800 + 56)
    constant H_after_sync :std_logic_vector(10 downto 0) := "01111010000"; --(800 + 56 + 120)
    
    constant V_pixels : std_logic_vector(10 downto 0) := "01010011010"; -- 666 (23 + 6 + 600 + 37)
    constant V_before_sync :std_logic_vector(10 downto 0) := "01001111101"; --(600 + 37)
    constant V_after_sync :std_logic_vector(10 downto 0) := "01010000011"; --(600 + 37 + 6)
    
    signal hcs : std_logic_vector(10 downto 0) := "00000000000"; --Horizontal and Vertical counters
    signal vcs : std_logic_vector(10 downto 0) := "00000000000";
    signal vsenable : std_logic := '0'; -- enable vertical counter

begin

   --Counter for the horiziontal sync signal
    counter_horizontal : process(clk50, clr)
    begin
        if clr = '1' then
            hcs <= "00000000000";
        elsif (clk50'event and clk50 = '1') then
            if hcs = H_pixels - 1 then
                -- counter has reached the end of pixel count
                hcs <= "00000000000";
                vsenable <= '1'; -- enable vertical counter
            else
                hcs <= hcs + 1; -- increment horizontal counter
                vsenable <= '0'; -- leave vsenable off
            end if;
        end if;
    end process counter_horizontal;
    h_sync <= '0' when (hcs >= H_before_sync and hcs < H_after_sync) else '1';
    
    --Counter for the vertical sync signal
    counter_vertical : process(clk50, clr)
    begin
        if clr = '1' then
            vcs <= "00000000000";
        elsif (clk50'event and clk50 = '1' and vsenable = '1') then
            if vcs = V_pixels - 1 then
                vcs <= "00000000000";
            else
                vcs <= vcs + 1; -- increment vertical counter
            end if;
        end if;
    end process counter_vertical;
    v_sync <= '0' when (vcs >= V_before_sync and vcs < V_after_sync) else '1';

    --Enable video out when withing the porches
    vidon <= '1' when (((hcs >= 0) and (hcs < 800))
                  and ((vcs >= 0)  and (vcs < 600))) else '0';

    -- output counters
    h_counter <= hcs;
    v_counter <= vcs;

end Behavioral;

