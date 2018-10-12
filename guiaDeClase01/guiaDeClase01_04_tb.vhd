--Guia 1, test bench ejercicio 4
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase01_04_tb IS
END guiaDeClase01_04_tb;
 
ARCHITECTURE behavior OF guiaDeClase01_04_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase01_04
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         ci : IN  std_logic;
         s : OUT  std_logic_vector(3 downto 0);
         co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal ci : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
   signal co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase01_04 PORT MAP (
          a => a,
          b => b,
          ci => ci,
          s => s,
          co => co
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for period*10;
		
		Ci <= '1';
		a <= "1110";
		b <= "0001";

      wait;
   end process;

END;
