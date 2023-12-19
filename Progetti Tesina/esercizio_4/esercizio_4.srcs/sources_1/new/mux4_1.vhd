----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.11.2021 17:17:22
-- Design Name: 
-- Module Name: mux4_1 - Behavioral
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



entity mux4_1 is
 Port ( 
    a: in std_logic_vector(0 to 3);
    c: in std_logic_vector(0 to 1);
    y: out std_logic
  );
end mux4_1;

architecture Behavioral of mux4_1 is
begin
    with c select
        y <= a(0) when "00",
             a(1) when "01",
             a(2) when "10",
             a(3) when "11",
             '-' when others;
end Behavioral;