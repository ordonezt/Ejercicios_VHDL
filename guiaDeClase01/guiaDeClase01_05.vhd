--Guia 1, ejercicio 5
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity guiaDeClase01_05 is
	 Generic( N: NATURAL:=4);
    Port ( a : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b : in  STD_LOGIC_VECTOR (N-1 downto 0);
           ci : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (N-1 downto 0);
           co : out  STD_LOGIC);
end guiaDeClase01_05;

architecture ARCH_guiaDeClase01_05 of guiaDeClase01_05 is

signal CarryChain: std_logic_vector(N-1 downto 0);

begin

E1: FOR i IN 0 to N-1 generate

	E2: if i = 0 generate
			E3: entity work.guiaDeClase00_03(ARCH_guiaDeClase00_03)
			port map(
						Cin	=> Ci,
						A 		=> A(i),
						B		=>	B(i),
						S		=>	S(i),
						Cout	=> CarryChain(i)
						);
	end generate;
	
	E4: if i > 0 and i < N-1 generate
			E5: entity work.guiaDeClase00_03(ARCH_guiaDeClase00_03)
			port map(
						Cin	=> CarryChain(i-1),
						A 		=> A(i),
						B		=>	B(i),
						S		=>	S(i),
						Cout	=> CarryChain(i)
						);
	end generate;
	
	E6: if i = N-1 generate
			E7: entity work.guiaDeClase00_03(ARCH_guiaDeClase00_03)
			port map(
						Cin	=> CarryChain(i-1),
						A 		=> A(i),
						B		=>	B(i),
						S		=>	S(i),
						Cout	=> Co
						);
	end generate;

end generate;

end ARCH_guiaDeClase01_05;