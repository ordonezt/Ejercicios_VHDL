library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myUartRx is
	Generic (baudRate : integer := 9600;
				sysClk: integer := 100000000;
				dataSize : integer := 8);
	
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				dataRd: out std_logic;
				dataRx: out std_logic_vector (dataSize - 1 downto 0);
				rx: in std_logic);
end myUartRx;

architecture ARCH_myUartRx of myUartRx is
	
	type state_t is ( Reset, StandBy, Start, Delay, Shift, Finish);
	--signal state_now, state_nxt: state_t;
	signal state: state_t;
	
	--constant divBaud: std_logic_vector(13 downto 0):= sysClk/baudRate;
	signal rstBaud, enaBaud, halfBitTime, bitTime: std_logic;
	--signal baudCount: 	unsigned(13-1 downto 0);
	--signal bitTime: 		integer range 8192 to 0:=sysClk/baudRate;
	--signal halfBitTime: 	integer range 8102 to 0:=bitTime/2;
	
	signal bitCount: unsigned (4-1 downto 0);
	signal data, dataRxAux: std_logic_vector (dataSize - 1 downto 0);
	
begin
	
	--Proceso secuencial sincronico
	P1: process(clk)
	begin
		if Rising_Edge(clk) then
			if rst = '1' then
				state <= Reset;
			else
				case state is
					---------------------------------
					when Reset =>
						dataRxAux 	<= X"00";
						
						state <= StandBy;
					---------------------------------
					when StandBy =>
						rstBaud 	<= '1';
						enaBaud 	<= '0';
						bitCount <= X"0";
						dataRd 	<= '0';
						data 		<= X"00";
						--dataRx 	<= X"00";
						
						if rx = '0' then
							state <= Start;
						end if;
					---------------------------------
					when Start =>
						rstBaud 	<= '0';
						enaBaud 	<= '1';
						
						if halfBitTime = '1' then
							state <= Delay;
							
							rstBaud 	<= '1';
							enaBaud 	<= '0';
						end if;
					---------------------------------
					when Delay =>
						rstBaud 	<= '0';
						enaBaud 	<= '1';
						
						if bitTime = '1' then
							if bitCount = dataSize 	then
									state <= Finish;
							else
								state <= Shift;
							end if;
						end if;
					---------------------------------
					when Shift =>
						data 		<= data(dataSize-2 downto 0) & rx;
						bitCount <= bitCount + 1;
						
						state <= Delay;
					---------------------------------
					when Finish =>
						
						if rx = '1' then --Bit de stop
							dataRd <= '1';
							DataRxAux <= data;
						end if;
						
						state <= StandBy;
					---------------------------------
				end case;
			end if;
		end if;
	end process P1;

	--Instancio contador M=fclk/Brate
		ContBaud: entity work.guiaDeClase03_01(ARCH_guiaDeClase03_01)
		Generic MAP(M => sysClk/BaudRate)
		PORT MAP(
		clk 			=> clk,
		rst 			=> rstBaud,
		ena 			=> EnaBaud,
		salidaM_2 	=> halfBitTime,
		salidaM 		=> bitTime
		);
	
	Inst_myReverse: entity work.myReverse(Behavioral)
	GENERIC MAP( N => dataSize)
	PORT MAP(
		dataIn => dataRxAux,
		dataOut => dataRx
	);

end ARCH_myUartRx;

