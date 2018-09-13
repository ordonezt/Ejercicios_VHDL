--Guia 0, ejercicio 2
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_02 is
Port ( a : in std_logic_vector (3 downto 0);
		 c : out std_logic);
end guiaDeClase00_02;

architecture ARCH_guiaDeClase00_02 of guiaDeClase00_02 is

signal X: std_logic_vector;

begin

C <= X(1) and X(0);
X(1) <= A(3) and A(2);
X(0) <= A(1) and A(0);

end ARCH_guiaDeClase00_02;

