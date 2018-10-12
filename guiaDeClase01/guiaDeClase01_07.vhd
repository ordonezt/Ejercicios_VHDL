--Guia 1, ejercicio 7
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase01_07 is
Generic (N: integer := 4);
Port ( 	binario: in std_logic_vector (N-1 downto 0);
			gray : out std_logic_vector (N-1 downto 0));
end guiaDeClase01_07;

architecture ARCH_guiaDeClase01_07 of guiaDeClase01_07 is

begin

gray <= binario xor ('0'&binario(N-1 downto 1));

end ARCH_guiaDeClase01_07;

