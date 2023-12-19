----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2021 15:45:06
-- Design Name: 
-- Module Name: TB_shift_beha - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_shift_beha is
--  Port ( );
end TB_shift_beha;

architecture Behavioral of TB_shift_beha is

component shift_register_beha is 
     Port (
        input: in std_logic;
        output: out std_logic_vector(0 to 3);
        clock_in: in std_logic;
        reset_in: in std_logic;
        Y: in std_logic;    --{1,2}
        v: in std_logic;     --{S,D}
        en: in std_logic
     );
end component;

signal INPUT : std_logic := '0';
signal CLK: std_logic;
signal K : std_logic := '0'; --Y
signal V: std_logic := '0';
signal E : std_logic := '0';
signal R: std_logic := '0';
signal O: std_logic_vector(0 to 3) := "0000";

 constant CLK_period : time := 10 ns;

begin
uut: shift_register_beha
port map(
    input=>INPUT,
        output(0 to 3) => O,
        clock_in => CLK,
        reset_in => R,
        Y => K,
        v => V,
        en => E
);
CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
  
  stim_proc: process
   begin		
      wait for 100 ns;	
      wait for CLK_period*10;
		
		K <= '0'; --Y
        V <= '1';
        E <= '0';
		wait for 10 ns;
		INPUT <= '0';
        wait for 10 ns;
        E <= '1';
        wait for 10 ns;
        
        E <= '0';
		wait for 10 ns;
		INPUT <= '0';
        wait for 10 ns;
        E <= '1';
        wait for 10 ns;
        
        E <= '0';
		wait for 10 ns;
		INPUT <= '1';
        wait for 10 ns;
        E <= '1';
        wait for 10 ns;
        
        E <= '0';
		wait for 10 ns;
		INPUT <= '1';
        wait for 10 ns;
        E <= '1';
      wait;
   end process;
end Behavioral;