--Guia 0, ejercicio 6
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_06 is
    Port ( entrada,control : in  STD_LOGIC;
           salida : out  STD_LOGIC);
end guiaDeClase00_06;

architecture ARCH_guiaDeClase00_06 of guiaDeClase00_06 is

begin

salida <= 'Z' when (control = '0' ) else entrada;
			

end ARCH_guiaDeClase00_06;

