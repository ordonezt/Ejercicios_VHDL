--Guia 1, ejercicio 2
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase01_02 is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           c : in  STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (3 downto 0));
end guiaDeClase01_02;

architecture ARCH_guiaDeClase01_02 of guiaDeClase01_02 is

begin

E1:	FOR i IN 0 to 3 generate

	s(i) <= 	a(i) when c(i) = '1' else
				'Z';
			
end generate;

end ARCH_guiaDeClase01_02;

