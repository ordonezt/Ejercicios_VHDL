--Guia 2, ejercicio 1
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity guiaDeClase02_01 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end guiaDeClase02_01;

architecture ARCH_guiaDeClase02_01 of guiaDeClase02_01 is

begin

FFD:	process(clk)
begin

	if Rising_Edge(clk) then
		if rst = '1' then
			Q <= '0';
		else
			Q <= D;
		end if;
	end if;
end process FFD;
end ARCH_guiaDeClase02_01;

