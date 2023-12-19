----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.12.2021 12:12:44
-- Design Name: 
-- Module Name: flip_flop - Behavioral
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

entity flip_flop is
 Port ( 
    clock_in: in std_logic;
    data_in: in std_logic_vector(9 downto 0);
    data_out: out std_logic_vector(9 downto 0)
 );
end flip_flop;

architecture Behavioral of flip_flop is

begin
process(clock_in)
begin
    if rising_edge(clock_in) then
        data_out <= data_in;
    end if;

end process;
end Behavioral;
