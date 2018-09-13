--Guia 0, ejercicio 1
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_01 is
    Port ( a,b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end guiaDeClase00_01;

architecture ARCH_guiaDeClase00_01 of guiaDeClase00_01 is

begin

c <= a AND b;

end ARCH_guiaDeClase00_01;

