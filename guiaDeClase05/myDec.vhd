library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity myDec is
	 Generic(N: natural := 16);
    Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           Y : out  STD_LOGIC_VECTOR (N-1 downto 0));
end myDec;

architecture ARCH_myDec of myDec is

begin

	Y <= std_logic_vector( signed(A)-1 );
	
end ARCH_myDec;

