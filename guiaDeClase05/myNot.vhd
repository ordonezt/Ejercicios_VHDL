library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myNot is
	Generic( N: integer := 8);
	Port( X: in 	std_logic_vector(N-1 downto 0);
			Y: out 	std_logic_vector(N-1 downto 0));
end myNot;

architecture ARCH_myNot of myNot is

begin

	Y <= not(X);

end ARCH_myNot;

