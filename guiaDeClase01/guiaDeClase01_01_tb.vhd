--Guia 1, test bench ejercicio 1
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase01_01_tb IS
END guiaDeClase01_01_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_01_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase01_01
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         c : IN  std_logic_vector(1 downto 0);
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := "1010";
   signal c : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase01_01 PORT MAP (
          a => a,
          c => c,
          s => s
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for period*10;
		c <= "00";
		wait for period*10;
		c <= "01";
		wait for period*10;
		c <= "10";
		wait for period*10;
		c <= "11";
		
      wait;
   end process;

END;
