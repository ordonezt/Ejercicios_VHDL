--Guia 0, test bench ejercicio 8
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase00_08_tb IS
END guiaDeClase00_08_tb;
 
ARCHITECTURE ARCH_guiaDeClase00_08_tb OF guiaDeClase00_08_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase00_08
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         igual : OUT  std_logic;
         aMayorB : OUT  std_logic;
         bMayorA : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal igual : std_logic;
   signal aMayorB : std_logic;
   signal bMayorA : std_logic;
	
	constant period : time := 10 ns;
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase00_08 PORT MAP (
          a => a,
          b => b,
          igual => igual,
          aMayorB => aMayorB,
          bMayorA => bMayorA
        );
	
	stim_proc: process
   begin		
      wait for 100 ns;	
		
		--Igualdad
		wait for period;
		a <= "10000001";
		b <= "10000001";
		-- a mayor que b
		wait for period;
		a <= "10000011";
		b <= "10000001";
		--b mayor que a
		wait for period;
		a <= "10000001";
		b <= "10000011";
		
   end process;
	
END;
