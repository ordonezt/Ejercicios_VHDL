--Guia 2, ejercicio 12
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity guiaDeClase02_12 is
	Generic (N: integer := 4);
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				ena: in std_logic;
				dir: in std_logic;
				q : out std_logic_vector (N-1 downto 0));
end guiaDeClase02_12;

architecture ARCH_guiaDeClase02_12 of guiaDeClase02_12 is
signal count : signed(N-1 downto 0) := to_signed(0,N);

begin

	--PROCESO SECUENCIAL SINCRONICO
	P1: process(clk)
	begin
	
		if Rising_Edge(clk) then
		
			if rst = '1' then
				count <= to_signed(0,N);
			else
				
				if ena = '1' then
					
					if dir = '0' then --Ascendente
						
						count <= count + 1;
					
					else --Descendente
						
						count <= count - 1;
					end if;
				end if;
			end if;
		end if;
	end process P1;
	
	Q <= std_logic_vector(count);
	
end ARCH_guiaDeClase02_12;

