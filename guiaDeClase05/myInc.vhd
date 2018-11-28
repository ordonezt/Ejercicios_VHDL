library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity myInc is
	 Generic(N: natural := 16);
    Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Y : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myInc;

architecture ARCH_myInc of myInc is

begin

	Y <= std_logic_vector( signed(A)+1 );
	
end ARCH_myInc;

