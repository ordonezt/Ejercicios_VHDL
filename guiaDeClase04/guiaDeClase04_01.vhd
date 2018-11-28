library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity myUartTx is
	Generic (baudRate : integer := 9600;
				sysClk 	: integer := 100000000;
				dataSize : integer := 8);
	Port ( clk: in std_logic;
			 rst: in std_logic;
			 dataWr: in std_logic;
			 dataTx: in std_logic_vector (dataSize - 1 downto 0);
			 ready: out std_logic;
			 tx: out std_logic);
end myUartTx;

architecture ARCH_myUartTx of myUartTx is

	TYPE state_t is (Idle, Start, Delay, Send, Stop);
	
	signal state: state_t;
	
	signal EnaBaud, rstBaud, bitTime: std_logic;
	
	signal bitCount: unsigned(4-1 downto 0);
	signal data, dataTxMirror: std_logic_vector(dataSize-1 downto 0);
	
begin
	
	--Maquina de Estados:
		P1: process(clk)
		begin
			if Rising_Edge(clk) then
				if rst = '1' then
					state <= Idle;
				else
					case state is
						-----------------------
						when Idle =>
							--Salidas:
								Tx <= '1';
								ready <= '1';
							--Señales:
								data <= (others => '0');
								bitCount <= (others => '0');
								rstBaud <= '1';
								enaBaud <= '0';
							--Transicion:
								if dataWr = '1' then
									data <= dataTxMirror;
									ready <= '0';
									state <= Start;
								end if;
						-----------------------
						when Start =>
							--Salidas:
								Tx <= '0';
							--Señales:
								rstBaud <= '0';
								enaBaud <= '1';
							--Transicion:
								state <= Delay;
						-----------------------
						when Delay =>
							--Salidas:
							--Señales:
							--Transicion:
								if bitTime = '1' then
									state <= Send;
								end if;
						-----------------------
						when Send =>
							--Salidas:
								Tx <= data(dataSize-1-to_integer(bitCount));
							--Señales:
								bitCount <= bitCount + 1;
							--Transicion:
								if bitCount = dataSize then
									state <= Stop;
								else
									state <= Delay;
								end if;
						-----------------------
						when Stop =>
							--Salidas:
								Tx <= '1';
							--Señales:
							--Transicion:
								if bitTime = '1' then
									state <= Idle;
								end if;
						-----------------------
					end case;
				end if;
			end if;
		end process P1;
		
		--Instancio contador M=fclk/Brate
		ContBaud: entity work.guiaDeClase03_01(ARCH_guiaDeClase03_01)
		Generic MAP(M => sysClk/BaudRate)
		PORT MAP(
		clk => clk,
		rst => rstBaud,
		ena => EnaBaud,
		salidaM => bitTime
		);
		
		--Doy vuelta el dato
		Inst_myReverse: entity work.myReverse(Behavioral)
		GENERIC MAP( N => dataSize)
		PORT MAP(
			dataIn => dataTx,
			dataOut => dataTxMirror
			);
end ARCH_myUartTx;

