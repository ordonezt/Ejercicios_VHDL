--Guia 2, ejercicio 6
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase02_06 is
	Generic (N: integer := 4);
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				d: in std_logic;
				q : out std_logic);
end guiaDeClase02_06;

architecture ARCH_guiaDeClase02_06 of guiaDeClase02_06 is

signal Q_nxt, Q_now: std_logic_vector(N-1 downto 0) := (others=>'0');

begin

	--PROCESO SECUENCIAL SINCRONICO
	P1: process(clk)
	begin
		if Rising_Edge(clk) then
			if rst = '1' then
				Q_now <= (others => '0');
			else
				Q_nxt <= Q_nxt(N-2 downto 0) & D;
				Q_now <= Q_nxt;
			end if;
		end if;
	end process P1;
	
	--LOGICA COMBINACIONAL SALIDA
	P3: process(Q_now)
	begin
		Q <= Q_now(N-1);
	end process P3;
	
end ARCH_guiaDeClase02_06;

