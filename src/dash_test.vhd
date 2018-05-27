--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:02:28 05/26/2018
-- Design Name:   
-- Module Name:   C:/Users/BPOGODA/Desktop/ucisw2_projekt-master/ucisw2_projekt-master/src/dash_test.vhd
-- Project Name:  ucisw_projekt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: player_movement
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
 
ENTITY dash_test IS
END dash_test;
 
ARCHITECTURE behavior OF dash_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT player_movement
    PORT(
         clk50 : IN  std_logic;
         DataRdy : IN  std_logic;
         B1_Status : IN  std_logic_vector(7 downto 0);
         B2_X : IN  std_logic_vector(7 downto 0);
         B3_Y : IN  std_logic_vector(7 downto 0);
         player_x : OUT  std_logic_vector(10 downto 0);
         player_y : OUT  std_logic_vector(10 downto 0);
         player_action : OUT  std_logic_vector(2 downto 0);
         player_action_ready : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk50 : std_logic := '0';
   signal DataRdy : std_logic := '0';
   signal B1_Status : std_logic_vector(7 downto 0) := (others => '0');
   signal B2_X : std_logic_vector(7 downto 0) := (others => '0');
   signal B3_Y : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal player_x : std_logic_vector(10 downto 0);
   signal player_y : std_logic_vector(10 downto 0);
   signal player_action : std_logic_vector(2 downto 0);
   signal player_action_ready : std_logic;

   -- Clock period definitions
   constant clk50_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: player_movement PORT MAP (
          clk50 => clk50,
          DataRdy => DataRdy,
          B1_Status => B1_Status,
          B2_X => B2_X,
          B3_Y => B3_Y,
          player_x => player_x,
          player_y => player_y,
          player_action => player_action,
          player_action_ready => player_action_ready
        );

   -- Clock process definitions
   clk50_process :process
   begin
		clk50 <= '0';
		wait for clk50_period/2;
		clk50 <= '1';
		wait for clk50_period/2;
   end process;
 

   -- Test process
	-- Run for 190 ns
   stim_proc: process
   begin		
      wait for 10 ns;	
		
		wait for clk50_period*2;

		-- Simulate dash to the left when ready
		B1_Status <= "00000001", "00000000" after clk50_period*2;
		DataRdy <= '1', '0' after clk50_period;

		wait for clk50_period*4;

		-- Simulate dash to the right when not ready
		B1_Status <= "00000010", "00000000" after clk50_period*2;
		DataRdy <= '1', '0' after clk50_period;

      wait;
   end process;

END;
