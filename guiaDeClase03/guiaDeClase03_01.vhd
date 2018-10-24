--Guia 3, ejercicio 1
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity guiaDeClase03_01 is
	Generic (M : natural := 10);
	Port ( 	clk : in std_logic;
				rst : in std_logic;
				ena : in std_logic;
				salidaM_2 : out std_logic;
				salidaM : out std_logic);
end guiaDeClase03_01;

architecture ARCH_guiaDeClase03_01 of guiaDeClase03_01 is

	constant N : integer := integer(ceil(log2(real (M))));
	
	Signal Q_nxt, Q_now: unsigned(N-1 downto 0) := to_unsigned(0,N);
	
	Signal SigSalidaM: std_logic;

begin

	P1: process(clk)
	begin
	
		if Rising_Edge(clk) then
			
			if rst = '1' then
				Q_now <= to_unsigned(0,N);
			else
				Q_now <= Q_nxt;
			end if;
		end if;
	end process P1;
	
	SigSalidaM <= '1' when Q_now = M else '0';
	
	SalidaM <= SigSalidaM;
	SalidaM_2 <= '1' when Q_now = (M/2) else '0';
	
	Q_nxt <= 		Q_now 			when ena = '0' 	else
					Q_now + 1 			when SigSalidaM = '0' 	else
				to_unsigned(0,N);
	
end ARCH_guiaDeClase03_01;

