--Guia 0, ejercicio 9
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_09 is
    Port ( entrada : in  STD_LOGIC_VECTOR (3 downto 0);
           a,b,c,d,e,f,g : out  STD_LOGIC);
end guiaDeClase00_09;

architecture ARCH_guiaDeClase00_09 of guiaDeClase00_09 is

signal salida: std_logic_vector(6 downto 0);

begin

a	<=	salida(6);
b 	<=	salida(5);
c 	<=	salida(4);
d 	<=	salida(3);
e 	<=	salida(2);
f 	<=	salida(1);
g 	<=	salida(0);

with entrada select
salida 	<= "1111110" when "0000", 
				"0110000" when "0001",
				"1101101" when "0010",
				"0111001" when "0011",
				"1110011" when "0100",
				"1011011" when "0101",
				"1011111" when "0110",
				"1110000" when "0111",
				"1111111" when "1000",
				"1111111" when "1001",
				"1110111" when "1010",
				"0011111" when "1011",
				"1001110" when "1100",
				"0111101" when "1101",
				"1001111" when "1110",
				"1000111" when "1111";
end ARCH_guiaDeClase00_09;

