--Guia 0, ejercicio 10
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase00_10 is
port(	entrada	:in 	std_logic_vector(3-1 downto 0);
		salida	:out	std_logic_vector(8-1 downto 0));
end guiaDeClase00_10;

architecture ARCH_guiaDeClase00_10 of guiaDeClase00_10 is

begin

	process(entrada)
	begin
	
		case entrada is
			when "000" =>
				salida <= "00000001";
			when "001" =>
				salida <= "00000010";
			when "010" =>
				salida <= "00000100";
			when "011" =>
				salida <= "00001000";
			when "100" =>
				salida <= "00010000";
			when "101" =>
				salida <= "00100000";
			when "110" =>
				salida <= "01000000";
			when "111" =>
				salida <= "10000000";
			when others=>
				salida <= "00000000";
		
		end case;
	
	end process;

end ARCH_guiaDeClase00_10;

