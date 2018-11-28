library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myRegister is
	Generic( N: integer:=8);
	Port( clk: in std_logic;
			rst: in std_logic;
			save: in std_logic;
			D: in std_logic_vector(N-1 downto 0);
			Q: out std_logic_vector(N-1 downto 0));
end myRegister;

architecture ARCH_myRegister of myRegister is

	signal Reg, Reg_nxt: std_logic_vector(N-1 downto 0);
	
begin

	P1: process(clk)
	begin
		if Rising_Edge(clk) then
			if rst = '1' then
				Reg <= (others => '0');
			else
				Reg <= Reg_nxt;
			end if;
		end if;
	end process P1;
	
	P2: process(save, D, Reg)
	begin
		if save = '1' then
			Reg_nxt <= D;
		else
			Reg_nxt <= Reg;
		end if;
	end process P2;
	
	Q <= Reg;
	
end ARCH_myRegister;

