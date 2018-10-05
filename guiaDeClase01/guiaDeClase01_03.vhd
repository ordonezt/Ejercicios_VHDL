--Guia 1, ejercicio 3
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase01_03 is
	 Generic	( N: NATURAL );
    Port 	(
					a : in  	STD_LOGIC_VECTOR 	(N-1 downto 0);
					c : in  	STD_LOGIC_VECTOR 	(N-1 downto 0);
					s : out  STD_LOGIC_VECTOR 	(N-1 downto 0)
				);
					
end guiaDeClase01_03;

architecture ARCH_guiaDeClase01_03 of guiaDeClase01_03 is

begin

E1:	FOR i IN 0 to 3 generate

	s(i) <= 	a(i) when c(i) = '1' else
			'Z';
			
end generate;

end ARCH_guiaDeClase01_03;

