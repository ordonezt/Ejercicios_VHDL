--Guia 2, ejercicio 4
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase02_04 is
	Generic (N: integer := 4);
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				ena: in std_logic;
				d: in std_logic_vector (N-1 downto 0);
				q : out std_logic_vector (N-1 downto 0));
end guiaDeClase02_04;

architecture ARCH_guiaDeClase02_04 of guiaDeClase02_04 is

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

end ARCH_guiaDeClase02_04;

