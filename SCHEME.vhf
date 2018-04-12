--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SCHEME.vhf
-- /___/   /\     Timestamp : 04/12/2018 10:07:58
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/lab/Desktop/ucisw2_projekt-master/zajecia/ucisw_projekt/SCHEME.vhf -w C:/Users/lab/Desktop/ucisw2_projekt-master/zajecia/ucisw_projekt/SCHEME.sch
--Design Name: SCHEME
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity SCHEME is
   port ( btn_south : in    std_logic; 
          Clk_50MHz : in    std_logic; 
          led       : out   std_logic_vector (7 downto 0); 
          VGA_B     : out   std_logic; 
          VGA_G     : out   std_logic; 
          VGA_HS    : out   std_logic; 
          VGA_R     : out   std_logic; 
          VGA_VS    : out   std_logic);
end SCHEME;

architecture BEHAVIORAL of SCHEME is
   signal XLXN_3    : std_logic_vector (10 downto 0);
   signal XLXN_4    : std_logic_vector (10 downto 0);
   signal led_DUMMY : std_logic_vector (7 downto 0);
   component vga_800x600
      port ( clk50     : in    std_logic; 
             clr       : in    std_logic; 
             h_sync    : out   std_logic; 
             v_sync    : out   std_logic; 
             vidon     : out   std_logic; 
             h_counter : out   std_logic_vector (10 downto 0); 
             v_counter : out   std_logic_vector (10 downto 0));
   end component;
   
   component vga_pixel
      port ( vidon     : in    std_logic; 
             h_counter : in    std_logic_vector (10 downto 0); 
             v_counter : in    std_logic_vector (10 downto 0); 
             red_out   : out   std_logic; 
             green_out : out   std_logic; 
             blue_out  : out   std_logic);
   end component;
   
begin
   led(7 downto 0) <= led_DUMMY(7 downto 0);
   XLXI_5 : vga_800x600
      port map (clk50=>Clk_50MHz,
                clr=>btn_south,
                h_counter(10 downto 0)=>XLXN_3(10 downto 0),
                h_sync=>VGA_HS,
                vidon=>led_DUMMY(0),
                v_counter(10 downto 0)=>XLXN_4(10 downto 0),
                v_sync=>VGA_VS);
   
   XLXI_6 : vga_pixel
      port map (h_counter(10 downto 0)=>XLXN_3(10 downto 0),
                vidon=>led_DUMMY(0),
                v_counter(10 downto 0)=>XLXN_4(10 downto 0),
                blue_out=>VGA_B,
                green_out=>VGA_G,
                red_out=>VGA_R);
   
end BEHAVIORAL;


