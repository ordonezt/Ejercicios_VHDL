library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myAndN is
	Generic( N: integer := 8);
	Port( 	A: in 	std_logic_vector(N-1 downto 0);
				B: in 	std_logic_vector(N-1 downto 0);
				C: out 	std_logic_vector(N-1 downto 0));
end myAndN;

architecture ARCH_myAndN of myAndN is

begin

	E1:FOR i IN 0 to N-1 generate
		C(i) <= 	A(i) and B(i);			
	end generate;

end ARCH_myAndN;

