library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myUartTest is
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				sw: in std_logic_vector (3 downto 0);
				tx: out std_logic;
				led: out std_logic_vector (7 downto 0);
				rx: in std_logic);
end myUartTest;

architecture ARCH_myUartTest of myUartTest is
	
	type stateRx_t is ( Reset, StandBy, Load);
	signal stateRx: stateRx_t;
	
	signal dataRd: std_logic;
	signal dataRx:std_logic_vector (7 downto 0);
	
	
	type stateTx_t is ( StandBy, Send);
	signal stateTx: stateTx_t;
	
	signal dataWr, ready: std_logic;
	signal dataTx: std_logic_vector(7 downto 0);
	
begin
	
	PRX: process(clk)
	begin
		if Rising_Edge(clk) then
			if rst = '1' then
				stateRx <= Reset;
			else
				case stateRx is
					--------------------------
					when Reset =>
						led <= X"00";
						stateRx <= StandBy;
					--------------------------
					when StandBy =>
						if dataRd = '1' then
							stateRx <= Load;
						end if;
					--------------------------
					when Load =>
						led <= dataRx;
						stateRx <= StandBy;
					--------------------------
				end case;
			end if;
		end if;
	end process PRX;
	
	
	dataTx <= sw & X"5";
	
	PTX: process(clk)
	begin
		if Rising_Edge(clk) then
			if rst = '1' then
				stateTx <= StandBy;
			else
				case stateTx is
				----------------------------------
					when StandBy =>
						--Señales:
							dataWr <= '0';
						--Tranciciones:
							if ready = '1' then
								stateTx <= Send;
							end if;
				----------------------------------
					when Send =>
						--Señales:
							dataWr <= '1';
						--Tranciciones:
							stateTx <= StandBy;
				----------------------------------
				end case;
			end if;
		end if;
	end process PTX;
	
	
	Uart:entity work.myUart(ARCH_myUart)
	PORT MAP(
		clk => clk,
		rst => rst,
		dataWr => dataWr,
		dataTx => dataTx,
		ready => ready,
		tx => tx,
		dataRd => dataRd,
		dataRx => dataRx,
		rx => rx
	);
	
end ARCH_myUartTest;

