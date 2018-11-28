library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity myAddOv is
	 Generic( N: integer := 8);
    Port ( A : in  	STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  	STD_LOGIC_VECTOR (N-1 downto 0);
           S : out  	STD_LOGIC_VECTOR (N-1 downto 0);
           Ov: out  	STD_LOGIC);
end myAddOv;

architecture ARCH_myAddOv of myAddOv is

	signal auxA, auxB: signed(N-1 downto 0);
	signal auxS: STD_LOGIC_VECTOR (N-1 downto 0);
begin

	auxA <= signed( A );
	auxB <= signed( B );
	
	auxS <= STD_LOGIC_VECTOR( auxA+auxB );
	
	S <= auxS;
	Ov <= ((not(A(N-1)) and not(B(N-1))) and auxS(N-1)) or ((A(N-1) and B(N-1)) and not(auxS(N-1)));
	
end ARCH_myAddOv;

