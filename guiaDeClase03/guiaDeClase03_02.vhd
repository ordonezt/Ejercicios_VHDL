--Guia 3, ejercicio 2
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

entity guiaDeClase03_02 is
	Port ( 	clk : in std_logic;
				rst : in std_logic;
				t : in std_logic;
				q : out std_logic);
end guiaDeClase03_02;

architecture ARCH_guiaDeClase03_02 of guiaDeClase03_02 is

	Signal SigQ: std_logic := '0';

begin

	P1: process(clk)
	begin
		if Rising_Edge(clk) then
			if rst = '1' then
				SigQ<= '0';
			else
				if T = '1' then
					SigQ <= not(SigQ);
				else
					SigQ <= SigQ;
				end if;
			end if;
		end if;
	end process P1;

	Q <= SigQ;
	
end ARCH_guiaDeClase03_02;

