--Guia 2, ejercicio 2
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity guiaDeClase02_02 is
Port ( clk : in  STD_LOGIC;
       clr : in  STD_LOGIC;
       D : in  STD_LOGIC;
       Q : out  STD_LOGIC);
end guiaDeClase02_02;

architecture ARCH_guiaDeClase02_02 of guiaDeClase02_02 is

begin

	FFD_clr: process(clk,clr)
	begin

		if clr = '1' then
			Q <= '0';
		elsif Rising_Edge(clk) then
			Q <= D;
		end if;
	end process FFD_clr;
end ARCH_guiaDeClase02_02;

