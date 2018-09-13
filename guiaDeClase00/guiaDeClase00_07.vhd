--Guia 0, ejercicio 7
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_07 is
    Port ( entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           control : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (7 downto 0));
end guiaDeClase00_07;

architecture ARCH_guiaDeClase00_07 of guiaDeClase00_07 is

begin

salida <= entrada when (control = '1' ) else (others => 'Z');

end ARCH_guiaDeClase00_07;

