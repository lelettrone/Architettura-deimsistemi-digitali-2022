----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2021 12:13:21
-- Design Name: 
-- Module Name: RippleCarryAdder - Structural
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

entity RippleCarryAdder is
 Port (
    a: in std_logic_vector (7 downto 0);
    b: in std_logic_vector (7 downto 0);
    c_in: in std_logic;
    c_out: out std_logic;
    s: out std_logic_vector (7 downto 0)
  );
end RippleCarryAdder;

architecture Structural of RippleCarryAdder is

component FullAdder is   
   Port ( 
      a: in std_logic;
      b: in std_logic;
      carry_in: in std_logic;
      carry_out: out std_logic;
      ris: out std_logic
  );
end component;

signal carry_temp: std_logic_vector(6 downto 0);
        
begin
F1: FullAdder port map(a(0), b(0), c_in, carry_temp(0), s(0));
F: for i in 1 to 6 generate
Fi:  FullAdder port map(a(i), b(i), carry_temp(i-1), carry_temp(i), s(i));
F8:  FullAdder port map(a(7), b(7), carry_temp(6), c_out, s(7));
   end generate;
end Structural;
