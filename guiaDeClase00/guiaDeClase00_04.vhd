--Guia 0, ejercicio 4
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_04 is
Port ( a : in std_logic_vector (3 downto 0);
		 p : out std_logic);
end guiaDeClase00_04;

architecture ARCH_guiaDeClase00_04 of guiaDeClase00_04 is

begin

p <= a(3) xor a(2) xor a(1) xor a(0);

end ARCH_guiaDeClase00_04;

