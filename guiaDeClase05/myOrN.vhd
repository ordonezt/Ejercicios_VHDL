library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myOrN is
	 Generic( N: integer := 8);
    Port ( A : in  	STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  	STD_LOGIC_VECTOR (N-1 downto 0);
           C : out  	STD_LOGIC_VECTOR (N-1 downto 0));
end myOrN;

architecture ARCH_myOrN of myOrN is

begin

	E1:FOR i IN 0 to N-1 generate
		C(i) <= 	A(i) or B(i);			
	end generate;

end ARCH_myOrN;

