--Guia 3, test bench ejercicio 1
--Alumno: Tomás Bautista Ordóñez
--Legajo: 1595659
--GitLab User: toordonez
--Mail: tomasbautista.o@gmail.com


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY guiaDeClase03_01_tb IS
END guiaDeClase03_01_tb;
 
ARCHITECTURE behavior OF guiaDeClase03_01_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT guiaDeClase03_01
	 Generic( M: natural);
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ena : IN  std_logic;
         salidaM_2 : OUT  std_logic;
         salidaM : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal ena : std_logic := '1';

 	--Outputs
   signal salidaM_2 : std_logic;
   signal salidaM : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: guiaDeClase03_01
	GENERIC MAP( M => 10)
	PORT MAP (
          clk => clk,
          rst => rst,
          ena => ena,
          salidaM_2 => salidaM_2,
          salidaM => salidaM
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
	
		wait for clk_period*20;
		rst <= '1';
		wait for clk_period;
		rst <= '0';
		
		wait for clk_period*10;
		ena <= '0';
		wait for clk_period;
		ena <= '1';

      wait;
   end process;

END;
