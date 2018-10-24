--Guia 2, test bench ejercicio 6
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY guiaDeClase02_06_tb IS
END guiaDeClase02_06_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_06_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase02_06
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         d : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal d : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase02_06 PORT MAP (
          clk => clk,
          rst => rst,
          d => d,
          q => q
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
      rst <= '0';
      wait for 100 ns;	

      wait until Falling_Edge(clk);
		D <= '1';
		
		wait until Falling_Edge(clk);
		D <= '0';
		
		wait until Falling_Edge(clk);
		D <= '0';
		
		wait until Falling_Edge(clk);
		D <= '1';
		
		wait for 8*clk_period;
		rst <= '1';
		
      wait;
   end process;

END;
