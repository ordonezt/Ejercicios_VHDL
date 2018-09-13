--Guia 0, ejercicio 8
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_08 is
    Port ( a,b : in  STD_LOGIC_VECTOR (7 downto 0);
           igual,aMayorB,bMayorA : out  STD_LOGIC);
end guiaDeClase00_08;

architecture ARCH_guiaDeClase00_08 of guiaDeClase00_08 is

begin

igual 	<= '1' when (a=b) else '0';
aMayorB 	<= '1' when (a>b) else '0';
bMayorA 	<= '1' when (b>a) else '0';

end ARCH_guiaDeClase00_08;

