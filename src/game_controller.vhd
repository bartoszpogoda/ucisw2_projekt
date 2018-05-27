----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:45:58 04/12/2018 
-- Design Name: 
-- Module Name:    game_controller - Behavioral 
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

entity game_controller is
   Port (
        clk50 : in std_logic;
        
        DataRdy : in std_logic;
   
        h_counter: in std_logic_vector(10 downto 0);
        v_counter: in std_logic_vector(10 downto 0);
        v_sync : in std_logic;
        vidon : in std_logic;
        
        player_x : in std_logic_vector(10 downto 0);
        player_y : in std_logic_vector(10 downto 0);
        player_dash_ready : in std_logic;

        red_out: out std_logic;
        green_out: out std_logic;
        blue_out: out std_logic;
        
        reset : in std_logic
    );
end game_controller;

architecture Behavioral of game_controller is
   type GAMESTATE_TYPE is
   record
      IS_PLAYER_COLLISION : boolean;
      IS_GAME_OVER : boolean;
      PLAYER_LIVES : unsigned(1 downto 0);
   end record;

   type ENEMY_TYPE is
   record
      X  : SIGNED(10 downto 0);
      Y  : SIGNED(10 downto 0);
      X_velocity : SIGNED(3 downto 0);
      Y_velocity : SIGNED(3 downto 0);
      
      width : signed(10 downto 0);
      height : signed(10 downto 0);
   end record;
   type ENEMIES_ARR is array (9 downto 0) of ENEMY_TYPE; 

   constant player_size : std_logic_vector(10 downto 0) := "00000011110";
   constant player_detail_base_size : signed(10 downto 0) := "00000000110";
   constant player_detail_2base_size : signed(10 downto 0) := "00000001100";
   
   signal game_state : GAMESTATE_TYPE := (
      is_player_collision => false,
      player_lives => "11",
      is_game_over => false
   );
   
   constant enemy_1 : ENEMY_TYPE := ( 
      X => "00000001000",
      Y => "00000001000",
      X_velocity => "0010",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   constant enemy_2 : ENEMY_TYPE := ( 
      X => "00000001000",
      Y => "00001001000",
      X_velocity => "0001",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   constant enemy_3 : ENEMY_TYPE := ( 
      X => "00001001000",
      Y => "00000001000",
      X_velocity => "0010",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   constant enemy_4 : ENEMY_TYPE := ( 
      X => "00000001000",
      Y => "00000011000",
      X_velocity => "0001",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   constant enemy_5 : ENEMY_TYPE := ( 
      X => "01111000000",
      Y => "00000001000",
      X_velocity => "0001",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   constant enemy_6 : ENEMY_TYPE := ( 
      X => "00000001000",
      Y => "01110001000",
      X_velocity => "0001",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   constant enemy_7 : ENEMY_TYPE := ( 
      X => "00010001000",
      Y => "00110001000",
      X_velocity => "0001",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   constant enemy_8 : ENEMY_TYPE := ( 
      X => "01000001000",
      Y => "00011001000",
      X_velocity => "0001",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   constant enemy_9 : ENEMY_TYPE := ( 
      X => "00001101000",
      Y => "01000001000",
      X_velocity => "0001",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   constant enemy_10 : ENEMY_TYPE := ( 
      X => "11000001000",
      Y => "00000001011",
      X_velocity => "0001",
      Y_velocity => "0010",
      width => "00000001100",
      height =>  "00000001100"
   );
   
   signal enemies : ENEMIES_ARR := (
      0 => enemy_1, 
      1 => enemy_2, 
      2 => enemy_3, 
      3 => enemy_4, 
      4 => enemy_5, 
      5 => enemy_6, 
      6 => enemy_7, 
      7 => enemy_8, 
      8 => enemy_9,
      9 => enemy_10
   ); 
   signal in_red_out : std_logic := '0';
   signal in_green_out : std_logic := '0';
   signal in_blue_out : std_logic := '0';
   
   -- random counters
   signal x_pos_random : SIGNED(10 downto 0) := "01100100000";
   signal y_pos_random : SIGNED(10 downto 0) := "01100100000";
   signal c_random : SIGNED(10 downto 0) := "01100100000";
   
   function RESPAWN_ENEMY( current_enemy : ENEMY_TYPE ; x_pos_random : SIGNED(10 downto 0) ; y_pos_random : SIGNED(10 downto 0) ; c_random : SIGNED(10 downto 0))
      return ENEMY_TYPE is
   variable enemy : ENEMY_TYPE;
   begin
      enemy.width := current_enemy.width;
      enemy.height := current_enemy.height;
   
      enemy.X := x_pos_random;
      enemy.Y := y_pos_random;
      
      enemy.X_velocity := current_enemy.X_velocity;
      enemy.Y_velocity := current_enemy.Y_velocity;
      
      if x_pos_random mod 4 = 1 then
         enemy.X_velocity := -enemy.X_velocity;
      end if;
      
      if y_pos_random mod 8 = 1 then
         enemy.Y_velocity := -enemy.Y_velocity;
      end if;
      
      -- going right bottom corner direction
      if enemy.X_velocity > 0 and enemy.Y_velocity > 0 then
         if c_random mod 2 = 1 then
            enemy.Y := "00000000001"; -- 1
         else
            enemy.X := "00000000001"; -- 1
         end if;
      end if;
      
      -- going right top corner direction
      if enemy.X_velocity > 0 and enemy.Y_velocity < 0 then
         if c_random mod 2 = 1 then
            enemy.Y := "01001011000"; -- 600
         else
            enemy.X := "00000000001"; -- 1
         end if;
      end if;
      
      -- going left bottom corner direction
      if enemy.X_velocity < 0 and enemy.Y_velocity > 0 then
         if c_random mod 2 = 1 then
            enemy.Y := "00000000001"; -- 1
         else
            enemy.X := "01100011111"; -- 799
         end if;
      end if;
      
      -- going left top corner direction
      if enemy.X_velocity < 0 and enemy.Y_velocity < 0 then
         if c_random mod 2 = 1 then
            enemy.Y := "01001011000"; -- 600
         else
            enemy.X := "01100011111"; -- 799
         end if;
      end if;
      
      return enemy;

   end RESPAWN_ENEMY;
   
   function IS_BETWEEN(x : signed; a : signed; b : signed)
              return boolean is
   begin
      return x > a and x < b;

   end IS_BETWEEN;

   function IS_INSIDE(topLeftX : signed; topLeftY : signed; height : signed; width : signed; x : signed; y : signed)
              return boolean is
   begin
      return x > topLeftX and x < topLeftX + width and y > topLeftY and y < topLeftY + height;
   end IS_INSIDE;
   
begin
   --random counters 
   process(clk50, DataRdy)
   begin
      if rising_edge(clk50)then
      
         x_pos_random <= x_pos_random + "00000000001"; -- + 1
         y_pos_random <= y_pos_random + "00000000001"; -- + 1
         c_random <= c_random + "00000000001"; -- + 1
         
         if DataRdy = '1' then
            x_pos_random <= x_pos_random + "00000000011"; -- + 3
            y_pos_random <= y_pos_random + "00000000111"; -- + 7
            c_random <= c_random + "000000001111"; -- + 15
         end if;
      end if;
   end process;
      
   draw_display_area : process(clk50, vidon, h_counter, v_counter, player_x, player_y)
      variable current_enemy : ENEMY_TYPE;
   begin

      if rising_edge(clk50) and vidon = '1' then
         if game_state.IS_GAME_OVER then
            in_red_out <= '1';
            in_green_out <= '0';
            in_blue_out <= '0';
         else 
            in_red_out <= '0';
            in_green_out <= '0';
            in_blue_out <= '0';
         -- draw player
            if h_counter > player_x and signed(h_counter) < signed(player_x) + signed(player_size) then
               if v_counter > player_y and signed(v_counter) < signed(player_y) + signed(player_size) then


                  if   -- nose
                  (game_state.player_lives > "10" 
                  and IS_INSIDE(signed(player_x) + player_detail_2base_size, 
                         signed(player_y) + signed(player_size) - player_detail_2base_size,
                         player_detail_2base_size,
                         player_detail_base_size,
                         signed(h_counter),
                         signed(v_counter))) 
                  -- right eye
                  or (game_state.player_lives > "01" 
                  and IS_INSIDE(signed(player_x) + player_detail_base_size, 
                         signed(player_y) + player_detail_base_size,
                         player_detail_base_size,
                         player_detail_base_size,
                         signed(h_counter),
                         signed(v_counter))) 
                  -- left eye
                  or (game_state.player_lives > "00" 
                  and IS_INSIDE(signed(player_x) + signed(player_size) -player_detail_2base_size, 
                         signed(player_y) + player_detail_base_size,
                         player_detail_base_size,
                         player_detail_base_size,
                         signed(h_counter),
                         signed(v_counter)))
                  then 
                     in_red_out <= '0';
                     in_green_out <= '0';
                     in_blue_out <= '0';
                  else
                     -- if player has collision draw red;
                     if player_dash_ready = '1' then
                        in_green_out <= '1';
                     else
                        in_red_out <= '1';
                        in_green_out <= '1';
                        in_blue_out <= '1';
                     end if;
                  end if;

               end if;
            end if;

            -- draw enemies
            for I in enemies'range loop
               current_enemy := enemies(I);

               if signed(h_counter) > current_enemy.X and signed(h_counter) < current_enemy.X + current_enemy.width then
                  if signed(v_counter) > current_enemy.Y and signed(v_counter) < current_enemy.Y + current_enemy.height then
                     in_blue_out <= '1';
                  end if;
               end if;

            end loop;

         end if;
         
         red_out <= in_red_out;
         green_out <= in_green_out;
         blue_out <= in_blue_out;
      end if;
   end process draw_display_area;
   
   
   move_enemies : process (clk50, v_sync, v_counter, enemies, reset)
      variable current_enemy : ENEMY_TYPE;
   begin
         if rising_edge(clk50) then
            if reset = '1' then
               game_state.player_lives <= "11";
               game_state.IS_GAME_OVER <= false;
            elsif not game_state.IS_GAME_OVER and v_sync = '1' and h_counter = "01100011111" and v_counter = "01001010111" then -- 799x599
         
               for I in enemies'range loop
                  current_enemy := enemies(I);
                  
                  current_enemy.X := current_enemy.X + current_enemy.X_velocity;
                  current_enemy.Y := current_enemy.Y + current_enemy.Y_velocity;
                  
                  if current_enemy.X < 0 OR current_enemy.Y < 0 then -- przekrecil sie
                     current_enemy := RESPAWN_ENEMY(current_enemy, x_pos_random, y_pos_random, c_random);
                     
                  end if; -- end przekrecil sie
                  
                   -- check collision
                  if (IS_BETWEEN(current_enemy.X, signed(player_x), signed(player_x) + signed(player_size)) or IS_BETWEEN(current_enemy.X + current_enemy.width, signed(player_x), signed(player_x) + signed(player_size))) AND
                     (IS_BETWEEN(current_enemy.Y, signed(player_y), signed(player_y) + signed(player_size)) or IS_BETWEEN(current_enemy.Y + current_enemy.height, signed(player_y), signed(player_y) + signed(player_size))) then
                    
                     game_state.player_lives <= game_state.player_lives - "01";
                     current_enemy := RESPAWN_ENEMY(current_enemy, x_pos_random, y_pos_random, c_random);
                     
                     if game_state.player_lives = "00" then
                        -- player died, game over
                        game_state.IS_GAME_OVER <= true;
                     end if;
                     
                  end if;
                  
                  enemies(I) <= current_enemy;

               end loop;
            end if;
          
         end if;
   
   end process move_enemies;

end Behavioral;

