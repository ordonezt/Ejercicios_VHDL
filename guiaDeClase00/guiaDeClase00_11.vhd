--Guia 0, ejercicio 11
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_11 is
port (	entrada	: in 	std_logic_vector (3 downto 0);
			salida	: out std_logic_vector (1 downto 0));
end guiaDeClase00_11;

architecture ARCH_guiaDeClase00_11 of guiaDeClase00_11 is

signal aux1, aux2, aux3: std_logic;

begin
	
	aux1 <= entrada(1);
	aux2 <= entrada(2);
	aux3 <= entrada(3);
	
	process(aux1, aux2, aux3)
	begin
		
		if aux3 = '1' then
			salida <= "11";
			
		elsif aux2 = '1' then
			salida <= "10";
		
		elsif aux1 = '1' then
			salida <= "01";
		
		else 
			salida <= "00";
		end if;
	
	end process;

end ARCH_guiaDeClase00_11;

