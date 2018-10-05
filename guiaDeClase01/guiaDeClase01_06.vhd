--Guia 1, ejercicio 6
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com

-- CONVERSOR GRAY A BINARIO DE N BITS
--Metodo: Bmsb <= Gmsb
--			 Bn <= Gn xor Bn+1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase01_06 is
	Generic	(N: integer := 4);
	Port		(
					gray: in std_logic_vector (N-1 downto 0);
					binario : out std_logic_vector (N-1 downto 0)
				 );
end guiaDeClase01_06;

architecture ARCH_guiaDeClase01_06 of guiaDeClase01_06 is

signal SigBinario: std_logic_vector(N-1 downto 0);

begin

Binario <= SigBinario;

E1: FOR i IN 0 to N-1 generate

	E2: if i=0 generate
		SigBinario(N-1) <= Gray(N-1);
	end generate;
	
	E3: if i>0 generate
		SigBinario(N-1-i) <= Gray(N-1-i) xor SigBinario(N-i);
	end generate;

end generate;
end ARCH_guiaDeClase01_06;

