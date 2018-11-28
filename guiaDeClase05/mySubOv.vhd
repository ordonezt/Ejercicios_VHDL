library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mySubOv is
	 Generic( N: integer := 8);
    Port ( A : in  	STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  	STD_LOGIC_VECTOR (N-1 downto 0);
           S : out  	STD_LOGIC_VECTOR (N-1 downto 0);
           Ov: out  	STD_LOGIC);
end mySubOv;

architecture ARCH_mySubOv of mySubOv is

	signal auxA, auxB: signed(N-1 downto 0);
	signal auxS: STD_LOGIC_VECTOR (N-1 downto 0);
begin

	auxA <= signed( A );
	auxB <= signed( B );
	
	auxS <= STD_LOGIC_VECTOR( auxA-auxB );
	
	S <= auxS;
	Ov <= ((not(A(N-1)) and B(N-1)) and auxS(N-1)) or ((A(N-1) and not(B(N-1))) and not(auxS(N-1)));
	
end ARCH_mySubOv;

