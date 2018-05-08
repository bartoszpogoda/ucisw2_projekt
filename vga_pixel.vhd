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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity vga_pixel is
   Port (
        clk50 : in std_logic;
   
        h_counter: in std_logic_vector(10 downto 0);
        v_counter: in std_logic_vector(10 downto 0);
        v_sync : in std_logic;
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
   type ENEMY_TYPE is
   record
      X  : SIGNED(9 downto 0);
      Y  : SIGNED(9 downto 0);
      X_velocity : SIGNED(3 downto 0);
      Y_velocity : SIGNED(3 downto 0);
      
      width : signed(10 downto 0);
      height : signed(10 downto 0);
   end record;
   type ENEMIES_ARR is array (1 downto 0) of ENEMY_TYPE; 

   constant player_size : std_logic_vector(10 downto 0) := "00000011110";
   
   constant enemy_1 : ENEMY_TYPE := ( X => "0000001000",
                                    Y => "0000001000",
                                    X_velocity => "0010",
                                    Y_velocity => "0010",
                                    width => "00000001010",
                                    height =>  "00000001010");
   
  
   signal enemies : ENEMIES_ARR := (others => enemy_1); 
   signal in_red_out : std_logic := '0';
   signal in_green_out : std_logic := '0';
   signal in_blue_out : std_logic := '0';
   
   signal player_has_colision : boolean := false;
   
   function IS_BETWEEN(x : signed; a : signed; b : signed)
              return boolean is
   begin
      return x > a and x < b;

   end IS_BETWEEN;
   
begin

   draw_display_area : process(vidon, h_counter, v_counter, player_x, player_y, player_action)
      variable current_enemy : ENEMY_TYPE;
   begin

      in_red_out <= '0';
      in_green_out <= '0';
      in_blue_out <= '0';

     if vidon = '1' then
         -- draw player
         if h_counter > player_x and signed(h_counter) < signed(player_x) + signed(player_size) then
             if v_counter > player_y and signed(v_counter) < signed(player_y) + signed(player_size) then
                 
                 if player_action = '1' then
                     in_red_out <= '1';
                 else
                     in_green_out <= '1';
                 end if;

             end if;
         end if;
         
         
         -- draw enemies
         for I in 0 to 1 loop
            current_enemy := enemies(I);
            
            if signed(h_counter) > current_enemy.X and signed(h_counter) < current_enemy.X + current_enemy.width then
               if signed(v_counter) > current_enemy.Y and signed(v_counter) < current_enemy.Y + current_enemy.height then
                  in_blue_out <= '1';
               end if;
            end if;

         end loop;
        
         
         -- detect colision
         for I in 0 to 1 loop
            current_enemy := enemies(I);
            
            if IS_BETWEEN(current_enemy.X, signed(player_x), signed(player_x) + signed(player_size)) or IS_BETWEEN(current_enemy.X + current_enemy.width, signed(player_x), signed(player_x) + signed(player_size)) then
            
            
            end if;
            
            
            if signed(h_counter) > current_enemy.X and signed(h_counter) < current_enemy.X + current_enemy.width then
               if signed(v_counter) > current_enemy.Y and signed(v_counter) < current_enemy.Y + current_enemy.height then
                  in_blue_out <= '1';
               end if;
            end if;

         end loop;
         
         
         red_out <= in_red_out;
         green_out <= in_green_out;
         blue_out <= in_blue_out;
         
     end if;
   end process draw_display_area;
   
   
   move_enemies : process (v_sync, v_counter, enemies)
      variable current_enemy : ENEMY_TYPE;
   begin
         if rising_edge(clk50) and v_sync = '1' and h_counter = "01100011111" and v_counter = "01001010111" then -- 799x599
      
            for I in 0 to 1 loop
               current_enemy := enemies(I);
               
               current_enemy.X := current_enemy.X + current_enemy.X_velocity;
               current_enemy.Y := current_enemy.Y + current_enemy.Y_velocity;
               
               enemies(I) <= current_enemy;

            end loop;
          
         end if;
   
   end process move_enemies;

end Behavioral;

