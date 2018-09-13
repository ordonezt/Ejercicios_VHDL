--Guia 0, ejercicio 5
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_05 is
    Port ( a : in  STD_LOGIC_VECTOR(1 downto 0);
           c : in  STD_LOGIC;
           s : out  STD_LOGIC);
end guiaDeClase00_05;

architecture ARCH_guiaDeClase00_05 of guiaDeClase00_05 is

begin

s <= 	a(1) WHEN c = '1' ELSE
		a(0) WHEN c = '0' ELSE	
		'0';

end ARCH_guiaDeClase00_05;

