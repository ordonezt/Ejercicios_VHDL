--Guia 2, ejercicio 8
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

entity guiaDeClase02_08 is
	Generic (N: integer := 4);
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				ena: in std_logic;
				dir: in std_logic;
				dr, dl : in std_logic; -- Entrada serie izquierda y derecha
				d: in std_logic_vector (N-1 downto 0); -- entrada paralela
				q : out std_logic_vector (N-1 downto 0));
end guiaDeClase02_08;

architecture ARCH_guiaDeClase02_08 of guiaDeClase02_08 is

signal Q_now, Q_nxt: std_logic_vector(N-1 downto 0) := (others => '0');

begin

	--PROCESO SECUENCIAL SINCRONICO
	P1: process(clk)
	begin
	
		if Rising_Edge(clk) then
			if rst = '1' then
				Q_now <= D;
				Q_nxt <= D;
			else
				Q_now <= Q_nxt;
				
				if Ena = '1' then		--Si esta habilitado, desplazo
					
					if dir = '0' then	--Ascendente (desp izq)
						Q_nxt <= Q_nxt(N-2 downto 0) & Dl;
					
					else					--Descendente (desp der)
						Q_nxt <= Dr & Q_nxt(N-1 downto 1);
					
					end if;
				end if;
			end if;
		end if;
	end process P1;
	
	Q <= Q_now;

end ARCH_guiaDeClase02_08;

