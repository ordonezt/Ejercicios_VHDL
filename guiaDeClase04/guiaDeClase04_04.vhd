library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUartRxTest is
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				led: out std_logic_vector (7 downto 0);
				rx: in std_logic);
end myUartRxTest;

architecture ARCH_myUartRxTest of myUartRxTest is

	signal notRst: std_logic;
	signal dataRx:std_logic_vector (7 downto 0);

begin

	notRst<= not(rst);

	UartRx:entity work.myUartRx(ARCH_myUartRx)
		Generic Map(sysClk => 100000000)
		PORT MAP(
			clk => clk,
			rst => notrst,
			dataRd => open,
			dataRx => led,
			rx => rx
		);
		
end ARCH_myUartRxTest;

