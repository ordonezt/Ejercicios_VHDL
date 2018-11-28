----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:49:15 11/09/2018 
-- Design Name: 
-- Module Name:    indicador_de_cambios - arch_indicador_de_cambios 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity indicador_de_cambios is
    Port ( sw : in  STD_LOGIC_VECTOR (3 downto 0);
           q : out  STD_LOGIC;
			  rst: in STD_LOGIC;
			  clk: in STD_LOGIC			  
			  );
end indicador_de_cambios;

architecture arch_indicador_de_cambios of indicador_de_cambios is
signal sw_ant: std_logic_vector (3 downto 0);
begin
process (clk)
begin
	if rising_edge(clk) then
		if rst='1' then
			sw_ant<=sw;
			q<='0';
		else	
			sw_ant<=sw;
			if unsigned(sw_ant)=unsigned(sw) then
				q<='0';
			else
				q<='1';
			end if;
		end if;
	end if;
	
end process;

end arch_indicador_de_cambios;

