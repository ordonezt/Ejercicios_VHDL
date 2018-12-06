library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Rotador is
Generic( dataSize: natural := 8);
Port (		Rot: 		in std_logic_vector(dataSize-1 downto 0);
				DataIn: 	in std_logic_vector(dataSize-1 downto 0);
				DataOut: out std_logic_vector(dataSize-1 downto 0);
				cantRot: out std_logic_vector(dataSize-1 downto 0)
		);
end Rotador;

architecture ARCH_Rotador of Rotador is

begin

	cantRot <= Rot;
	
	with Rot select DataOut <=
									 DataIn(0) & DataIn(dataSize-1 downto 1) 			when X"07",
									 DataIn(1 downto 0) & DataIn(dataSize-1 downto 2) when X"06",
									 DataIn(2 downto 0) & DataIn(dataSize-1 downto 3) when X"05",
									 DataIn(3 downto 0) & DataIn(dataSize-1 downto 4) when X"04",
									 DataIn(4 downto 0) & DataIn(dataSize-1 downto 5) when X"03",
									 DataIn(5 downto 0) & DataIn(dataSize-1 downto 6) when X"02",
									 DataIn(6 downto 0) & DataIn(dataSize-1 downto 7) when X"01",
									 DataIn(0) & DataIn(dataSize-1 downto 1) 			when X"FF",
									 DataIn(1 downto 0) & DataIn(dataSize-1 downto 2) when X"FE",
									 DataIn(2 downto 0) & DataIn(dataSize-1 downto 3) when X"FD",
									 DataIn(3 downto 0) & DataIn(dataSize-1 downto 4) when X"FC",
									 DataIn(4 downto 0) & DataIn(dataSize-1 downto 5) when X"FB",
									 DataIn(5 downto 0) & DataIn(dataSize-1 downto 6) when X"FA",
									 DataIn(6 downto 0) & DataIn(dataSize-1 downto 7) when X"F0",
									 DataIn 														when others;
		
end ARCH_Rotador;

