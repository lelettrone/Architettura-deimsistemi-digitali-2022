----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.11.2021 12:42:18
-- Design Name: 
-- Module Name: contatore - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contatore is
    generic(
        N: integer := 8
    );
  Port ( 
    clk: in std_logic;
    rst: in std_logic;
    enable: in std_logic;
    count_end: out std_logic;
    count_out: out integer
  );
end contatore;

architecture Behavioral of contatore is

begin
process(clk,rst,enable)
variable count: integer  := 0;
    begin
        if(rst = '1') then
            count := 0;
        end if;
        if rising_edge(clk) then
            if(enable = '1') then
                if(count = N) then
                    count_end <= '1';
                    count := 0;
                else 
                count_end <= '0'; 
                count := count +1;
                end if;
          end if;
       end if;
       count_out <= count;
end process;
end Behavioral;
