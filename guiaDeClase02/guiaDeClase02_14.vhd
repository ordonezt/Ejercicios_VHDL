--Guia 2, ejercicio 14
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity guiaDeClase02_14 is
	Generic (N: integer := 4);
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				d: in std_logic;
				q : out std_logic_vector (N-1 downto 0));
end guiaDeClase02_14;

architecture ARCH_guiaDeClase02_14 of guiaDeClase02_14 is

	Signal enaCount: std_logic;
	
begin

	--Uso un detector de flancos y un contador binario ascendente con enable
	EdgeDet : entity work.guiaDeClase02_05(ARCH_guiaDeClase02_05)
	PORT MAP(
		clk => clk,
		rst => rst,
		d => d,
		ascendente => enaCount
	);
	
	EdgeCount : entity work.guiaDeClase02_11(ARCH_guiaDeClase02_11)
	GENERIC MAP( N => N )
	PORT MAP(
		clk => clk,
		rst => rst,
		ena => enaCount,
		q => q
	);
	
end ARCH_guiaDeClase02_14;