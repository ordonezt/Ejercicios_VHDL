--Guia 2, test bench ejercicio 2
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY guiaDeClase02_02_tb IS
END guiaDeClase02_02_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_02_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase02_02
    PORT(
         clk : IN  std_logic;
         clr : IN  std_logic;
         D : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clr : std_logic := '0';
   signal D : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase02_02 PORT MAP (
          clk => clk,
          clr => clr,
          D => D,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		clr <= '0';
		D <= '0';
      wait until falling_edge(clk);
		D <= '1';
		wait until falling_edge(clk);
		clr <= '1';
		wait until falling_edge(clk);
		D <= '0';
		clr <= '0';
      wait;
   end process;

END;
