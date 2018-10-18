--Guia 2, test bench ejercicio 1
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY guiaDeClase02_01_tb IS
END guiaDeClase02_01_tb;
 
ARCHITECTURE behavior OF guiaDeClase02_01_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase02_01
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         D : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal D : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase02_01 PORT MAP (
          clk => clk,
          rst => rst,
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
		wait for 100 ns;
		rst <= '0';
		D <= '0';
      wait for clk_period*3;
		D <= '1';
		wait for clk_period*3;
		rst <= '1';
		wait for clk_period*3;
		rst <= '0';
		D <= '0';
      wait;
		
   end process;

END;
