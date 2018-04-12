--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:28:42 04/12/2018
-- Design Name:   
-- Module Name:   C:/Users/lab/Desktop/ucisw2_projekt-master/zajecia/ucisw_projekt/vga_controller_test.vhd
-- Project Name:  ucisw_projekt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: vga_800x600
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
 
ENTITY vga_controller_test IS
END vga_controller_test;
 
ARCHITECTURE behavior OF vga_controller_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT vga_800x600
    PORT(
         clk50 : IN  std_logic;
         clr : IN  std_logic;
         h_sync : OUT  std_logic;
         v_sync : OUT  std_logic;
         h_counter : OUT  std_logic_vector(10 downto 0);
         v_counter : OUT  std_logic_vector(10 downto 0);
         vidon : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk50 : std_logic := '0';
   signal clr : std_logic := '0';

 	--Outputs
   signal h_sync : std_logic;
   signal v_sync : std_logic;
   signal h_counter : std_logic_vector(10 downto 0);
   signal v_counter : std_logic_vector(10 downto 0);
   signal vidon : std_logic;

   -- Clock period definitions
   constant clk50_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: vga_800x600 PORT MAP (
          clk50 => clk50,
          clr => clr,
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

      -- insert stimulus here 

      wait;
   end process;

END;
