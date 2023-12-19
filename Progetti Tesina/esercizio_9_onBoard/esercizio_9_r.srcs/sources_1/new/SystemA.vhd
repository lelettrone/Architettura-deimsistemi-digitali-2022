----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2021 15:43:15
-- Design Name: 
-- Module Name: SystemA - Structural
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

entity SystemA is
	Port(
		clockA: in std_logic;
		resetA: in std_logic;
		readA: out std_logic;
		endOpA: in std_logic;
		startA: in std_logic;
		rqtsT: out std_logic;
		serialData: out std_logic
	);
end SystemA;

architecture Structural of SystemA is

component UARTcomponent is
    Generic (
    --@48MHz
--    BAUD_DIVIDE_G : integer := 26;  --115200 baud
--    BAUD_RATE_G   : integer := 417

    --@26.6MHz
    BAUD_DIVIDE_G : integer := 14;  --115200 baud
    BAUD_RATE_G   : integer := 231
  );
  Port (  
    TXD   : out   std_logic   := '1';         -- Transmitted serial data output
    RXD   : in    std_logic;              -- Received serial data input
    CLK   : in    std_logic;              -- Clock signal
    DBIN  : in    std_logic_vector (7 downto 0);    -- Input parallel data to be transmitted
    DBOUT   : out   std_logic_vector (7 downto 0);    -- Recevived parallel data output
    RDA   : inout  std_logic;             -- Read Data Available
    TBE   : out   std_logic   := '1';         -- Transfer Buffer Emty
    RD    : in    std_logic;              -- Read Strobe
    WR    : in    std_logic;              -- Write Strobe
    PE    : out   std_logic;              -- Parity error   
    FE    : out   std_logic;              -- Frame error
    OE    : out   std_logic;              -- Overwrite error
    RST   : in    std_logic := '0');        -- Reset signal
end component;

component Trasmettitore is
	generic (
		N: integer := 10
	);
	Port (
		clock: in std_logic;
		start: in std_logic;
		wr: out std_logic;
		tbe: in std_logic;
		read: out std_logic := '1';
		endOp: in std_logic := '0';
		rtsT: out std_logic;
		enCount: out std_logic;
		countT: in integer;
		data: out std_logic_vector(7 downto 0)
		);
end component;

component contatore is
    generic(
        N: integer := 2
    );
  Port ( 
    clk: in std_logic;
    rst: in std_logic;
    enable: in std_logic;
    count_out: out integer
  );
end component;


signal data_temp: std_logic_vector(7 downto 0);
signal tbe_temp: std_logic;
signal wr_temp: std_logic;

signal rxdT: std_logic;
signal rdaT: std_logic;
signal rdT: std_logic;
signal peT: std_logic;
signal feT: std_logic;
signal oeT: std_logic;
signal dboutT: std_logic_vector(7 downto 0);

signal en_temp: std_logic;
signal count_temp: integer;

begin 

UART: UARTcomponent 
	generic map (
		BAUD_DIVIDE_G => 14,  --115200 baud
    	BAUD_RATE_G => 231
	)
	port map (
		TXD => serialData,
		RXD => rxdT,
		CLK => clockA,
		DBIN => data_temp,
		DBOUT => dboutT,
		RDA => rdaT,
		TBE => tbe_temp,
		RD => rdT,
		WR => wr_temp,
		PE => peT,
		FE => feT,
		OE => oeT,
		RST => resetA
	);

T: Trasmettitore
	generic map (
		N => 10
	)
	port map (
		clock => clockA,
		start => startA,
		wr => wr_temp,
		tbe => tbe_temp,
		read => readA,
		endOp => endOpA,
		rtsT => rqtsT,
		enCount => en_temp,
		countT => count_temp,
		data => data_temp
	);


CountA: contatore 
	generic map (
		N => 10
	)
	port map (
		clk => clockA,
		rst => resetA,
		enable => en_temp,
		count_out => count_temp
	);
	

end Structural;