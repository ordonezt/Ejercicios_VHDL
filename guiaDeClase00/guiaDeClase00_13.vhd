--Guia 0, ejercicio 13
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_13 is
port(	entrada 	: in 	std_logic_vector 	(7 downto 0);
		div		: in 	std_logic_vector 	(1 downto 0);
		salida 	: out std_logic_vector 	(7 downto 0));
end guiaDeClase00_13;

architecture ARCH_guiaDeClase00_13 of guiaDeClase00_13 is

signal div1, div2, div4, div8 : std_logic_vector(7 downto 0);

begin

div1 <= entrada;
div2 <= entrada(7) & entrada(7 downto 1);
div4 <= entrada(7) & entrada(7) & entrada(7 downto 2);
div8 <= entrada(7) & entrada(7) & entrada(7) & entrada(7 downto 3);

with div select salida <= 
									div1 	when "00",
									div2	when "01",
									div4	when "10",
									div8	when "11";

end ARCH_guiaDeClase00_13;
