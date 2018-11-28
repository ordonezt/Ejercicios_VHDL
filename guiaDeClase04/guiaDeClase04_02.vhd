----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:02 11/09/2018 
-- Design Name: 
-- Module Name:    myUartTxTest - arch_myUartTxTest 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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

entity myUartTxTest is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           sw : in  STD_LOGIC_VECTOR (3 downto 0);
           tx : out  STD_LOGIC);
end myUartTxTest;

architecture arch_myUartTxTest of myUartTxTest is
type Tstate is (stateA,stateB);
signal Q_now,Q_next: Tstate;
signal cambio,ready,dataWr: std_logic;
signal dataTx: std_logic_vector (7 downto 0);
begin

Inst_myUartTx: entity work.myUartTx (arch_myUartTx)
	generic map
		 (baudRate =>9600,
		  sysClk =>100000000,
		  dataSize =>8)
	PORT MAP(
		clk => clk,
		rst => rst,
		dataWr => dataWr,
		dataTx => dataTx,
		ready => ready,
		tx => tx
	);

--comparador 
	Inst_indicador_de_cambios: entity work.indicador_de_cambios (arch_indicador_de_cambios)
	PORT MAP(
		sw =>sw,
		q =>cambio,
		rst =>rst,
		clk =>clk 
	);

P1: process (clk)
begin
if rising_edge (clk) then
	if rst='1' then 
	Q_now<=stateA;
	else
	Q_now<=Q_next;
	end if;
end if;
end process;

--logica de estado futuro
P2: process (Q_now,cambio,ready)
begin
	case Q_now is 
	when stateA =>
		if cambio='1' and ready='1' then
			Q_next<=stateB;
		else
			Q_next<=stateA;
		end if;
	when stateB =>
		Q_next<=stateA;
	end case;
end process;

--logica de salida

P3: process (Q_now,sw)
begin
	case Q_now is
		when stateA =>
			dataTx<="00000000";
			dataWr<='0';
		when stateB =>
			dataTx<=sw&"0101";
			dataWr<='1';
	end case;
end process;


end arch_myUartTxTest;












































































--
------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date:    10:03:30 11/08/2018 
---- Design Name: 
---- Module Name:    myUartTxTest - ARCH_myUartTxTest 
---- Project Name: 
---- Target Devices: 
---- Tool versions: 
---- Description: 
----
---- Dependencies: 
----
---- Revision: 
---- Revision 0.01 - File Created
---- Additional Comments: 
----
------------------------------------------------------------------------------------
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--
---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
----library UNISIM;
----use UNISIM.VComponents.all;
--
--entity myUartTxTest is
--	Port ( 	clk: in std_logic;
--				rst: in std_logic;
--				sw: in std_logic_vector (3 downto 0);
--				tx: out std_logic);
--end myUartTxTest;
--
--architecture ARCH_myUartTxTest of myUartTxTest is
--
--	type state_t is ( StandBy, Send);
--	signal state: state_t;
--	
--	signal dataWr, ready, notRst, cambios: std_logic;
--	signal dataTx: std_logic_vector(7 downto 0);
--	
--begin
--	
--	
--	
--	notRst <= not(rst);
--	
--	UartTx: entity work.myUartTx(ARCH_myUartTx)
--	Generic Map(baudRate => 9600,
--				sysClk 	=> 100000000,
--				dataSize => 8)
--	PORT MAP(
--		clk => clk,
--		rst => notRst,
--		dataWr => dataWr,
--		ready => ready,
--		dataTx => dataTx,
--		tx => tx
--	);
--	DetDeCambios: entity work.indicador_de_cambios(arch_indicador_de_cambios)
--	PORT MAP(
--		sw => sw,
--		q => cambios,
--		rst => notRst,
--		clk => clk
--	);
--	P1: process(clk)
--	begin
--		if Rising_Edge(clk) then
--			if notRst = '1' then
--				state <= StandBy;
--			else
--				case state is
--				----------------------------------
--					when StandBy =>
--						--Señales:
--							dataWr <= '0';
--							dataTx <= (others => '0');
--						--Tranciciones:
--							if cambios = '1' and ready = '1' then
--								state <= Send;
--							end if;
--				----------------------------------
--					when Send =>
--						--Señales:
--							dataWr <= '1';
--							dataTx <= sw & "0101";
--						--Tranciciones:
--							state <= StandBy;
--				----------------------------------
--				end case;
--			end if;
--		end if;
--	end process P1;
--end ARCH_myUartTxTest;
--
