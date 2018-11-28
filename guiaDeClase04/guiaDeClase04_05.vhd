library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUart is
	Generic (baudRate : integer := 9600;
				sysClk: integer := 50000000;
				dataSize : integer := 8);
	
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				dataWr: in std_logic;
				dataTx: in std_logic_vector (dataSize - 1 downto 0);
				ready: out std_logic;
				tx: out std_logic;
				dataRd: out std_logic;
				dataRx: out std_logic_vector (dataSize - 1 downto 0);
				rx: in std_logic);
end myUart;

architecture ARCH_myUart of myUart is

begin
	
	UartTx: entity work.myUartTx(ARCH_myUartTx)
	PORT MAP(
		clk => clk,
		rst => rst,
		dataWr => DataWr,
		dataTx => DataTx,
		ready => ready,
		tx => tx
	);
	
	UartRx:entity work.myUartRx(ARCH_myUartRx)
		PORT MAP(
			clk => clk,
			rst => rst,
			dataRd => dataRd,
			dataRx => dataRx,
			rx => rx
		);

end ARCH_myUart;

