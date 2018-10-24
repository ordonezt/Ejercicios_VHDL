--Guia 2, ejercicio 9
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity guiaDeClase02_09 is
	Generic (N: integer := 4);
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				ena: in std_logic;
				q : out std_logic_vector (N-1 downto 0));
end guiaDeClase02_09;

architecture ARCH_guiaDeClase02_09 of guiaDeClase02_09 is

signal Q_now, Q_nxt : std_logic_vector(N-1 downto 0):= std_logic_vector(to_unsigned(1,N));

begin

	--PROCESO SECUENCIAL SINCRONICO
	P1: process(clk)
	begin
	
		if Rising_Edge(clk) then
		
			if rst = '1' then
				Q_now <= std_logic_vector(to_unsigned(1,N));
				Q_nxt <= std_logic_vector(to_unsigned(1,N));
			
			else
				Q_now <= Q_nxt;
				
				if ena = '1' then
					Q_nxt <= Q_nxt(N-2 downto 0) & Q_nxt(N-1);
				end if;
			end if;
		end if;
	end process P1;
	
	Q <= Q_now;
	
end ARCH_guiaDeClase02_09;

