--Guia 2, ejercicio 3
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase02_03 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ena : in  STD_LOGIC;
           d : in  STD_LOGIC;
           q : out  STD_LOGIC);
end guiaDeClase02_03;

architecture ARCH_guiaDeClase02_03 of guiaDeClase02_03 is

begin
	
	FFDRE: process(clk)
	begin
	
		if Rising_Edge(clk) then
			
			if rst = '0' then
				
				if ena = '1' then
					Q <= D;
				end if;
				
			end if;
		end if;
		
	end process FFDRE;
	
end ARCH_guiaDeClase02_03;

