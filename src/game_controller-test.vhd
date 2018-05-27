--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:04:56 05/27/2018
-- Design Name:   
-- Module Name:   C:/Users/BPOGODA/Desktop/ucisw2_projekt-master/ucisw2_projekt-master/src/game_controller-test.vhd
-- Project Name:  ucisw_projekt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: game_controller
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY game_controller_test IS
END game_controller_test;
 
ARCHITECTURE behavior OF game_controller_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT game_controller
    PORT(
         clk50 : IN  std_logic;
         DataRdy : IN  std_logic;
         h_counter : IN  std_logic_vector(10 downto 0);
         v_counter : IN  std_logic_vector(10 downto 0);
         v_sync : IN  std_logic;
         vidon : IN  std_logic;
         player_x : IN  std_logic_vector(10 downto 0);
         player_y : IN  std_logic_vector(10 downto 0);
         player_dash_ready : IN  std_logic;
         red_out : OUT  std_logic;
         green_out : OUT  std_logic;
         blue_out : OUT  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    
		COMPONENT vga_800x600
    PORT(
		clk50 : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           h_sync : out  STD_LOGIC;
           v_sync : out  STD_LOGIC;
           h_counter : out  STD_LOGIC_VECTOR (10 downto 0);
           v_counter : out  STD_LOGIC_VECTOR (10 downto 0);
           vidon : out  STD_LOGIC
         
        );
    END COMPONENT;

   --Inputs
   signal clk50 : std_logic := '0';
   signal DataRdy : std_logic := '0';
   signal h_counter : std_logic_vector(10 downto 0) := (others => '0');
   signal v_counter : std_logic_vector(10 downto 0) := (others => '0');
   signal v_sync : std_logic := '0';
   signal h_sync : std_logic := '0';
   signal vidon : std_logic := '0';
   signal player_x : std_logic_vector(10 downto 0) := "00100101100"; -- 300
   signal player_y : std_logic_vector(10 downto 0) := "00100101100"; -- 300
   signal player_dash_ready : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal red_out : std_logic;
   signal green_out : std_logic;
   signal blue_out : std_logic;

   -- Clock period definitions
   constant clk50_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: game_controller PORT MAP (
          clk50 => clk50,
          DataRdy => DataRdy,
          h_counter => h_counter,
          v_counter => v_counter,
          v_sync => v_sync,
          vidon => vidon,
          player_x => player_x,
          player_y => player_y,
          player_dash_ready => player_dash_ready,
          red_out => red_out,
          green_out => green_out,
          blue_out => blue_out,
          reset => reset
        );
		  
	  vga: vga_800x600 PORT MAP (
		 clk50 => clk50,
		  clr => reset,
		  h_sync => h_sync,
		  v_sync => v_sync,
		  h_counter => h_counter,
		  v_counter => v_counter,
		  vidon => vidon
	  );

   -- Clock process definitions
   clk50_process :process
   begin
		clk50 <= '0';
		wait for clk50_period/2;
		clk50 <= '1';
		wait for clk50_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk50_period*10;
		
		-- move player to simulate the colision
		-- enemy[8] moves from 140,520 -> 105,522 around 15ms in time
		-- we will place player at 105, 522 (no matter if its out of center-rectangle bound, its just colision test)
		 player_x <= "00001101001";
		 player_y <= "01000001010";


      wait;
   end process;

END;
