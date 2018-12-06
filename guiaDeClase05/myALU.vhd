library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myALU is
	 Generic ( dataSize: integer := 8);	
    Port ( clk : 	in  STD_LOGIC;
           rst : 	in  STD_LOGIC;
			  ena : 	in  STD_LOGIC;
           Cmd : 	in  STD_LOGIC_VECTOR (dataSize-1 downto 0);
           A 	: 	in  STD_LOGIC_VECTOR (dataSize-1 downto 0);
           B 	: 	in  STD_LOGIC_VECTOR (dataSize-1 downto 0);
           D0 	: 	out STD_LOGIC_VECTOR (dataSize-1 downto 0);
           D1 	: 	out STD_LOGIC_VECTOR (dataSize-1 downto 0);
			  ready: out STD_LOGIC);
end myALU;

architecture ARCH_myALU of myALU is

	type state_t is ( Reposo, Op, Regist);
	signal state_now, state_nxt: state_t;
	
	signal SumOv, SubOv, save :STD_LOGIC;
	signal notA, notB, Sum, Sub, AandB, AorB, ParcialD0, ParcialD1 :STD_LOGIC_VECTOR (dataSize-1 downto 0);
	signal AInc, ADec, Reg, AcatB :STD_LOGIC_VECTOR (2*dataSize-1 downto 0);
	
begin
	
	AcatB <= A&B;
	
	with Cmd select D0 <=
								notA 												when X"00",
								Sum 												when X"01",
								Sub 												when X"02",
								AandB 											when X"03",
								AorB 												when X"04",
								AInc	(2*dataSize-1 downto dataSize)	when X"05",
								ADec	(2*dataSize-1 downto dataSize)	when X"06",
								Reg	(2*dataSize-1 downto dataSize)	when X"07",
								Reg	(2*dataSize-1 downto dataSize)	when X"08",
								ParcialD0										when X"09",
								Cmd 												when others;
	
	with Cmd select D1 <=
								notB 												when X"00",
								(others => SumOv)								when X"01",
								(others => SubOv)								when X"02",
								(others => '0') 								when X"03",
								(others => '0') 								when X"04",
								AInc	(dataSize-1 downto 0)				when X"05",
								ADec	(dataSize-1 downto 0)				when X"06",
								Reg	(dataSize-1 downto 0)				when X"07",
								Reg	(dataSize-1 downto 0)				when X"08",
								ParcialD1										when X"09",
								Cmd 												when others;
	
	--Proceso secuencial sincronico
	P1: process(clk)
	begin
		if Rising_Edge(clk) then
			if rst = '1' then
				State_now <= Op;
			elsif ena = '1' then
				State_now <= State_nxt;
			end if;
		end if;
	end process P1;
	
	--Logica combinacional de estado futuro
	P2: process(state_now, Cmd)
	begin
		case state_now is
			
			when Reposo =>
				if Cmd = X"07" then
					state_nxt <= Regist;
				else
					state_nxt <= Op;
				end if;
				
			when Op =>
				state_nxt <= Reposo;
				
			when Regist =>						--Luego de registrar vuelvo a operando
				state_nxt <= Reposo;
			
		end case;
	end process P2;
	
	--Logica combinacional de salida
	P3: process(state_now, Cmd)
	begin
		
		ready <= '1';
		save <= '0';
		
		case state_now is
			when Reposo =>
				if Cmd = X"07" then			--Registro el dato
					save <= '1';
				end if;
				
			when Op =>
				--save <= '0';					--Si estoy operando no cambio el registro
				--ready <= '0';
				
			when Regist =>
				save <= '0';					--Doy la orden de registrar el dato
				ready <= '1';
				
		end case;
	end process P3;
	
	
	Inst_myNotA:entity work.myNot(ARCH_myNot)
	GENERIC MAP( N => dataSize )
	PORT MAP(
		X => A,
		Y => notA);
	
	Inst_myNotB:entity work.myNot(ARCH_myNot)
	GENERIC MAP( N => dataSize )
	PORT MAP(
		X => B,
		Y => notB);
		
	Inst_myAddOv:entity work.myAddOv(ARCH_myAddOv) 
	GENERIC MAP( N => dataSize )
	PORT MAP(
		A => A,
		B => B,
		S => Sum,
		Ov => SumOv);

	Inst_mySubOv:entity work.mySubOv(ARCH_mySubOv)
	GENERIC MAP( N => dataSize )
	PORT MAP(
		A => A,
		B => B,
		S => Sub,
		Ov => SubOv);

	Inst_myAndN:entity work.myAndN(ARCH_myAndN)
	GENERIC MAP( N => dataSize )
	PORT MAP(
		A => A,
		B => B,
		C => AandB);

	Inst_myOrN:entity work.myOrN(ARCH_myOrN)
	GENERIC MAP( N => dataSize )
	PORT MAP(
		A => A,
		B => B,
		C => AorB);


	Inst_myInc:entity work.myInc(ARCH_myInc)
	GENERIC MAP( N => 2*dataSize )
	PORT MAP(
		A => AcatB,
		Y => AInc);
	
	Inst_myDec:entity work.myDec(ARCH_myDec)
	GENERIC MAP( N => 2*dataSize )
	PORT MAP(
		A => AcatB,
		Y => ADec);
	
	Inst_myRegister:entity work.myRegister(ARCH_myRegister)
	GENERIC MAP( N => 2*dataSize )
	PORT MAP(
		clk => clk,
		rst => rst,
		save => save,
		D => AcatB,
		Q => Reg);
	
	Inst_Rotador:entity work.Rotador(ARCH_Rotador) 
	Generic Map( dataSize => dataSize)
	PORT MAP(
		Rot => A,
		DataIn => B,
		DataOut => ParcialD1,
		CantRot => ParcialD0
	);
end ARCH_myALU;

