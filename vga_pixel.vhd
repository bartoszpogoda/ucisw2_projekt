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
        
        DataRdy : in std_logic;
   
        h_counter: in std_logic_vector(10 downto 0);
        v_counter: in std_logic_vector(10 downto 0);
        v_sync : in std_logic;
        vidon : in std_logic;
        
        player_x : in std_logic_vector(10 downto 0);
        player_y : in std_logic_vector(10 downto 0);
        player_action : in std_logic_vector(2 downto 0);

        red_out: out std_logic;
        green_out: out std_logic;
        blue_out: out std_logic
    );
end vga_pixel;

architecture Behavioral of vga_pixel is
   type GAMESTATE_TYPE is
   record
      IS_PLAYER_COLLISION : boolean;
   end record;

   type ENEMY_TYPE is
   record
      X  : SIGNED(10 downto 0);
      Y  : SIGNED(10 downto 0);
      X_velocity : SIGNED(3 downto 0);
      Y_velocity : SIGNED(3 downto 0);
      
      is_coliding_with_player : boolean;
      
      width : signed(10 downto 0);
      height : signed(10 downto 0);
   end record;
   type ENEMIES_ARR is array (1 downto 0) of ENEMY_TYPE; 

   constant player_size : std_logic_vector(10 downto 0) := "00000011110";
   
   signal game_state : GAMESTATE_TYPE := (
      is_player_collision => false
   );
   
   constant enemy_1 : ENEMY_TYPE := ( 
      X => "00000001000",
      Y => "00000001000",
      X_velocity => "0010",
      Y_velocity => "0010",
      width => "00000001010",
      height =>  "00000001010",
      is_coliding_with_player => false
   );
   
   constant enemy_2 : ENEMY_TYPE := ( 
      X => "00000001000",
      Y => "00000001000",
      X_velocity => "0001",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001010",
      is_coliding_with_player => false
   );
   
   signal enemies : ENEMIES_ARR := (0 => enemy_1, 1 => enemy_2); 
   signal in_red_out : std_logic := '0';
   signal in_green_out : std_logic := '0';
   signal in_blue_out : std_logic := '0';
   
   -- random counters
   signal x_pos_random : SIGNED(10 downto 0) := "01100100000";
   signal y_pos_random : SIGNED(10 downto 0) := "01100100000";
   
   function IS_BETWEEN(x : signed; a : signed; b : signed)
              return boolean is
   begin
      return x > a and x < b;

   end IS_BETWEEN;
   
   function IS_PLAYER_COLIDING_WITH_ANY_ENEMY(player_x : signed; player_y : signed; enemies : ENEMIES_ARR)
              return boolean is
   begin
      for I in 0 to 1 loop
         if enemies(I).is_coliding_with_player = true then
            return true;
         end if;
      end loop;
   
      return false;
   end IS_PLAYER_COLIDING_WITH_ANY_ENEMY;
 
begin
   --random counters 
   process(clk50, DataRdy)
   begin
      if rising_edge(clk50)then
      
         x_pos_random <= x_pos_random + "00000000001"; -- + 1
         y_pos_random <= y_pos_random + "00000000001"; -- + 1
         
         if DataRdy = '1' then
            x_pos_random <= x_pos_random + "00000000011"; -- + 3
            y_pos_random <= y_pos_random + "00000000111"; -- + 7
         end if;
      end if;
   end process;


   draw_display_area : process(clk50, vidon, h_counter, v_counter, player_x, player_y, player_action)
      variable current_enemy : ENEMY_TYPE;
   begin

     if rising_edge(clk50) and vidon = '1' then
     
         in_red_out <= '0';
         in_green_out <= '0';
         in_blue_out <= '0';
     
         -- draw player
         if h_counter > player_x and signed(h_counter) < signed(player_x) + signed(player_size) then
             if v_counter > player_y and signed(v_counter) < signed(player_y) + signed(player_size) then
                 
                 -- if player has collision draw red;
                 if IS_PLAYER_COLIDING_WITH_ANY_ENEMY(signed(player_x), signed(player_y), enemies) = true then
                     in_red_out <= '1';
                 else 
                     in_red_out <= '1';
                     in_green_out <= '1';
                     in_blue_out <= '1';
                    
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
        
         
        
         
         
         red_out <= in_red_out;
         green_out <= in_green_out;
         blue_out <= in_blue_out;
         
     end if;
   end process draw_display_area;
   
   
   move_enemies : process (clk50, v_sync, v_counter, enemies)
      variable current_enemy : ENEMY_TYPE;
   begin
         if rising_edge(clk50) and v_sync = '1' and h_counter = "01100011111" and v_counter = "01001010111" then -- 799x599
      
            for I in 0 to 1 loop
               current_enemy := enemies(I);
               
               current_enemy.X := current_enemy.X + current_enemy.X_velocity;
               current_enemy.Y := current_enemy.Y + current_enemy.Y_velocity;
               
               if current_enemy.X < 0 OR current_enemy.Y < 0 then -- przekrecil sie
                  current_enemy.X := x_pos_random;
                  current_enemy.Y := y_pos_random;
                  
                  if x_pos_random mod 2 = 1 then
                     current_enemy.X_velocity := -current_enemy.X_velocity;
                     current_enemy.Y_velocity := -current_enemy.Y_velocity;
                  end if;
                  
                  -- going right bottom corner direction
                  if current_enemy.X_velocity > 0 and current_enemy.Y_velocity > 0 then
                     if x_pos_random mod 2 = 1 then
                        current_enemy.Y := "00000000001"; -- 1
                     else
                        current_enemy.X := "00000000001"; -- 1
                     end if;
                  end if;
                  
                  -- going right top corner direction
                  if current_enemy.X_velocity > 0 and current_enemy.Y_velocity < 0 then
                     if x_pos_random mod 2 = 1 then
                        current_enemy.Y := "01001011000"; -- 600
                     else
                        current_enemy.X := "00000000001"; -- 1
                     end if;
                  end if;
                  
                  -- going left bottom corner direction
                  if current_enemy.X_velocity < 0 and current_enemy.Y_velocity > 0 then
                     if x_pos_random mod 2 = 1 then
                        current_enemy.Y := "00000000001"; -- 1
                     else
                        current_enemy.X := "01100011111"; -- 799
                     end if;
                  end if;
                  
                  -- going left top corner direction
                  if current_enemy.X_velocity < 0 and current_enemy.Y_velocity < 0 then
                     if x_pos_random mod 2 = 1 then
                        current_enemy.Y := "01001011000"; -- 600
                     else
                        current_enemy.X := "01100011111"; -- 799
                     end if;
                  end if;
                  
               end if; -- end przekrecil sie
               
                -- check collision
               if (IS_BETWEEN(current_enemy.X, signed(player_x), signed(player_x) + signed(player_size)) or IS_BETWEEN(current_enemy.X + current_enemy.width, signed(player_x), signed(player_x) + signed(player_size))) AND
                  (IS_BETWEEN(current_enemy.Y, signed(player_y), signed(player_y) + signed(player_size)) or IS_BETWEEN(current_enemy.Y + current_enemy.height, signed(player_y), signed(player_y) + signed(player_size))) then
                  current_enemy.is_coliding_with_player := true;
               else
                  current_enemy.is_coliding_with_player := false;
               end if;
               
               enemies(I) <= current_enemy;

            end loop;
          
         end if;
   
   end process move_enemies;

end Behavioral;

