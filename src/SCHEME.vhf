--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : SCHEME.vhf
-- /___/   /\     Timestamp : 05/21/2018 15:08:38
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/lab/Desktop/ucisw2_projekt-master-21-05-1-commit/SCHEME.vhf -w C:/Users/lab/Desktop/ucisw2_projekt-master-21-05-1-commit/SCHEME.sch
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
          PS2_Clk   : out   std_logic; 
          PS2_Data  : out   std_logic; 
          VGA_B     : out   std_logic; 
          VGA_G     : out   std_logic; 
          VGA_HS    : out   std_logic; 
          VGA_R     : out   std_logic; 
          VGA_VS    : out   std_logic);
end SCHEME;

architecture BEHAVIORAL of SCHEME is
   signal XLXN_3         : std_logic_vector (10 downto 0);
   signal XLXN_4         : std_logic_vector (10 downto 0);
   signal XLXN_5         : std_logic;
   signal XLXN_7         : std_logic_vector (10 downto 0);
   signal XLXN_8         : std_logic_vector (10 downto 0);
   signal XLXN_15        : std_logic_vector (7 downto 0);
   signal XLXN_16        : std_logic_vector (7 downto 0);
   signal XLXN_17        : std_logic_vector (7 downto 0);
   signal XLXN_51        : std_logic;
   signal XLXN_52        : std_logic;
   signal PS2_Data_DUMMY : std_logic;
   signal PS2_Clk_DUMMY  : std_logic;
   signal VGA_VS_DUMMY   : std_logic;
   component vga_800x600
      port ( clk50     : in    std_logic; 
             clr       : in    std_logic; 
             h_sync    : out   std_logic; 
             v_sync    : out   std_logic; 
             vidon     : out   std_logic; 
             h_counter : out   std_logic_vector (10 downto 0); 
             v_counter : out   std_logic_vector (10 downto 0));
   end component;
   
   component PS2_Mouse
      port ( PS2_Data  : inout std_logic; 
             PS2_Clk   : inout std_logic; 
             InitOK    : out   std_logic; 
             DataRdy   : out   std_logic; 
             B1_Status : out   std_logic_vector (7 downto 0); 
             B2_X      : out   std_logic_vector (7 downto 0); 
             B3_Y      : out   std_logic_vector (7 downto 0); 
             Clk_50MHz : in    std_logic; 
             Reset     : in    std_logic; 
             Clk_Sys   : in    std_logic);
   end component;
   
   component player_movement
      port ( clk50               : in    std_logic; 
             DataRdy             : in    std_logic; 
             B1_Status           : in    std_logic_vector (7 downto 0); 
             B2_X                : in    std_logic_vector (7 downto 0); 
             B3_Y                : in    std_logic_vector (7 downto 0); 
             player_x            : out   std_logic_vector (10 downto 0); 
             player_y            : out   std_logic_vector (10 downto 0); 
             player_action       : out   std_logic_vector (2 downto 0); 
             player_action_ready : out   std_logic);
   end component;
   
   component vga_pixel
      port ( clk50             : in    std_logic; 
             DataRdy           : in    std_logic; 
             v_sync            : in    std_logic; 
             vidon             : in    std_logic; 
             player_dash_ready : in    std_logic; 
             h_counter         : in    std_logic_vector (10 downto 0); 
             v_counter         : in    std_logic_vector (10 downto 0); 
             player_x          : in    std_logic_vector (10 downto 0); 
             player_y          : in    std_logic_vector (10 downto 0); 
             red_out           : out   std_logic; 
             green_out         : out   std_logic; 
             blue_out          : out   std_logic; 
             reset             : in    std_logic);
   end component;
   
begin
   PS2_Clk <= PS2_Clk_DUMMY;
   PS2_Data <= PS2_Data_DUMMY;
   VGA_VS <= VGA_VS_DUMMY;
   XLXI_5 : vga_800x600
      port map (clk50=>Clk_50MHz,
                clr=>btn_south,
                h_counter(10 downto 0)=>XLXN_3(10 downto 0),
                h_sync=>VGA_HS,
                vidon=>XLXN_5,
                v_counter(10 downto 0)=>XLXN_4(10 downto 0),
                v_sync=>VGA_VS_DUMMY);
   
   XLXI_10 : PS2_Mouse
      port map (Clk_Sys=>Clk_50MHz,
                Clk_50MHz=>Clk_50MHz,
                Reset=>btn_south,
                B1_Status(7 downto 0)=>XLXN_15(7 downto 0),
                B2_X(7 downto 0)=>XLXN_16(7 downto 0),
                B3_Y(7 downto 0)=>XLXN_17(7 downto 0),
                DataRdy=>XLXN_51,
                InitOK=>open,
                PS2_Clk=>PS2_Clk_DUMMY,
                PS2_Data=>PS2_Data_DUMMY);
   
   XLXI_19 : player_movement
      port map (B1_Status(7 downto 0)=>XLXN_15(7 downto 0),
                B2_X(7 downto 0)=>XLXN_16(7 downto 0),
                B3_Y(7 downto 0)=>XLXN_17(7 downto 0),
                clk50=>Clk_50MHz,
                DataRdy=>XLXN_51,
                player_action=>open,
                player_action_ready=>XLXN_52,
                player_x(10 downto 0)=>XLXN_7(10 downto 0),
                player_y(10 downto 0)=>XLXN_8(10 downto 0));
   
   XLXI_22 : vga_pixel
      port map (clk50=>Clk_50MHz,
                DataRdy=>XLXN_51,
                h_counter(10 downto 0)=>XLXN_3(10 downto 0),
                player_dash_ready=>XLXN_52,
                player_x(10 downto 0)=>XLXN_7(10 downto 0),
                player_y(10 downto 0)=>XLXN_8(10 downto 0),
                reset=>btn_south,
                vidon=>XLXN_5,
                v_counter(10 downto 0)=>XLXN_4(10 downto 0),
                v_sync=>VGA_VS_DUMMY,
                blue_out=>VGA_B,
                green_out=>VGA_G,
                red_out=>VGA_R);
   
end BEHAVIORAL;


