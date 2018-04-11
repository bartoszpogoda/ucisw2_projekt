library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_800x600 is 
    Port (
        clk50: in std_logic;
        clr: in std_logic;
        h_sync: out std_logic;
        v_sync: out std_logic;

        h_counter: out std_logic_vector(9 downto 0);
        v_counter: out std_logic_vector(9 downto 0);

        vidon : out std_logic
    );
end vga_800x600;

architecture vga_800x600 of vga_800x600 is
    --porches
    constant H_pixels : std_logic_vector(9 downto 0) := "1110011000"; -- 1040 (64 + 120 + 800 + 56)
    constant H_BackPorch : std_logic_vector(9 downto 0) := "0010111000"; -- 184 = (64 + 120)
    constant H_FrontPorch : std_logic_vector(9 downto 0) := "1111010000"; -- 976 = (64 + 120 + 800)
    
    constant V_pixels : std_logic_vector(9 downto 0) := "1010011010"; -- 666 (23 + 6 + 600 + 37)
    constant V_BackPorch : std_logic_vector(9 downto 0) := "0000011101"; -- 29 = (23 + 6)
    constant V_FrontPorch : std_logic_vector(9 downto 0) := "1001110101"; -- 629 (23 + 6 + 600)
    
    signal hcs, vcs : std_logic_vector(9 downto 0); --Horizontal and Vertical counters
    signal vsenable: std_logic; -- enable vertical counter
begin

    --Counter for the horiziontal sync signal
    process(clk50, clr)
    begin
        if clr = '1' then
            hcs <= "0000000000";
        elsif (clk'event and clk50 = '1') then
            if hcs = H_pixels - 1 then
                -- counter has reached the end of pixel count
                hcs <= "0000000000";
                vsenable <= '1'; -- enable vertical counter
            else
                hcs <= hcs + 1; -- increment horizontal counter
                vsenable <= '0'; -- leave vsenable off
        end if;
    end process;
    h_sync <= '0' when hcs < 128 else '1';

    --Counter for the vertical sync signal
    process(clk50, clr)
    begin
        if clr = '1' then
            vcs <= "0000000000";
        elsif (clk'event and clk50 = '1' and vsenable = '1') then
            if vcs = V_pixels - 1 then
                vcs <= "0000000000";
            else
                vcs <= vcs + 1; -- increment vertical counter
        end if;
    end process;
    v_sync <= '0' when vcs < 2 else '1';

    --Enable video out when withing the porches
    vidon <= '1' when (((hcs >= H_BackPorch) and (hcs < H_FrontPorch))
                  and ((vcs >= V_BackPorch)  and (vcs < V_FrontPorch))) else '0';

    -- output counters
    h_counter <= hcs;
    v_counter <= vcs;

end vga_800x600;