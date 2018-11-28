library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mySerialALU is
	Generic (baudRate : integer := 9600;
				sysClk: integer := 50000000;
				dataSize : integer := 8);
	Port ( 	clk: in std_logic;
				rst: in std_logic;
				tx: out std_logic;
				rx: in std_logic);
end mySerialALU;

architecture ARCH_mySerialALU of mySerialALU is

	type state_t is ( RxCmd, RxD0, RxD1, LoadALU, DelayALU, TxCmd, TxD0, TxD1);
	signal state_now, state_nxt: state_t;
	
	signal enaALU, dataWr, ready, dataRd, ALUready: std_logic;
	
	signal Cmd, data0, data1, Ans0, Ans1: std_logic_vector(dataSize-1 downto 0);
	
	signal CmdReg, data0Reg, data1Reg: std_logic_vector(dataSize-1 downto 0);
	signal save0, save1, save2: std_logic;
	
	signal dataTx, dataRx: std_logic_vector(dataSize-1 downto 0);
	
	signal notRst: std_logic;
	
begin

	notRst <= not(rst);
	
--++++++++++++++++++++++++++++++++++++++++++++++++++--


	--Proceso secuencial sincronico
	P1: process(clk)
	begin
		if Rising_Edge(clk) then
			if notRst = '1' then
				state_now <= RxCmd;
			else
				state_now <= state_nxt;
			end if;
		end if;
	end process P1;


--++++++++++++++++++++++++++++++++++++++++++++++++++--

	
	--Logica combinacional de estado futuro
	P2: process(state_now, dataRd, ready, ALUready)
	begin
		
		case state_now is
			----------------
			when RxCmd =>
				if dataRd = '1' then				--Cuando termino de leer el comando
					state_nxt <= RxD0;			--espero a recibir el primer dato
				else
					state_nxt <= RxCmd;
				end if;
			----------------
			when RxD0 =>
				if dataRd = '1' then				--Cuando termino de leer el primer
					state_nxt <= RxD1;			--dato espero a recibir el segundo
				else
					state_nxt <= RxD0;
				end if;
			----------------
			when RxD1 =>
				if dataRd = '1' then				--Cuando termino de leer el segundo
					state_nxt <= LoadALU;		--dato, cargo la trama a la ALU
				else
					state_nxt <= RxD1;
				end if;
			----------------
			when LoadALU =>						--Luego, espero un pulso de clk para
														--guardar el registro
				state_nxt <= DelayALU;
			----------------
			when DelayALU =>
				if ALUready = '1' then			--Cuando termino de leer el resultado
					state_nxt <= TxCmd;			--comienzo a transmitir la trama
				else
					state_nxt <= DelayALU;
				end if;
			----------------
			when TxCmd =>
				if ready = '1' then				--Cuando termino de enviar Cmd
					state_nxt <= TxD0;			--envio el dato0
				else
					state_nxt <= TxCmd;
				end if;
			----------------
			when TxD0 =>
				if ready = '1' then				--Cuando termino de enviar D0
					state_nxt <= TxD1;			--envio el dato1
				else
					state_nxt <= TxD0;
				end if;
			----------------
			when TxD1 =>
				if ready = '1' then				--Cuando termino de enviar la trama
					state_nxt <= RxCmd;			--me preparo para recibir una nueva
				else
					state_nxt <= TxD1;
				end if;
			----------------
		end case;
	end process P2;
	
	
--++++++++++++++++++++++++++++++++++++++++++++++++++--
	
	
	--Logica combinacional de salida
	P3: process(state_now, dataRd, ready, dataRx, CmdReg, Ans0, Ans1)
	begin
		
		enaALU <= '0';						--Deshabilito la ALU
		dataWr <= '0';						--Bloqueo la transmision
		dataTx <= (others => '0');		--Limpio la entrada del Tx
		
		Cmd 	<= (others => '0');		--Limpio los registros
		save0 <= '0';
		data0 <= (others => '0');
		save1 <= '0';
		data1 <= (others => '0');
		save2 <= '0';
		
		case state_now is
			----------------
			when RxCmd =>
				if dataRd = '1' then				--Si llega un comando lo guardo
					Cmd <= dataRx;
					save0 <= '1';
				end if;
			----------------
			when RxD0 =>
				if dataRd = '1' then				--Si llega un dato lo guardo
					data0 <= dataRx;
					save1 <= '1';
				end if;
			----------------
			when RxD1 =>
				if dataRd = '1' then				--Si llega un dato lo guardo
					data1 <= dataRx;
					save2 <= '1';
				end if;
			----------------
			when LoadALU =>
				enaALU <= '1';						--Habilito la ALU
			----------------
			when DelayALU =>
				enaALU <= '1';						--Habilito la ALU
			----------------
			when TxCmd =>
				if ready = '1' then				--Si la UART esta libre, transmito
					dataTx <= CmdReg;				--la trama enviando primero el comando
					dataWr <= '1';					--realizado
				end if;
			----------------
			when TxD0 =>
				if ready = '1' then				--Cuando termino de enviar Cmd
					dataTx <= Ans0;				--envio el dato0
					dataWr <= '1';
				end if;
			----------------
			when TxD1 =>
				if ready = '1' then				--Cuando termino de enviar dato0
					dataTx <= Ans1;				--envio el dato1
					dataWr <= '1';	
				end if;
			----------------
			end case;
	end process P3;

	Inst_myALU:entity work.myALU( ARCH_myALU )
	GENERIC MAP(dataSize	=> dataSize)
	PORT MAP(
		clk => clk,
		rst => notRst,
		ena => enaALU,
		Cmd => CmdReg,
		A => data0Reg,
		B => data1Reg,
		D0 => Ans0,
		D1 => Ans1,
		ready => ALUready);
		
	Inst_myUart:entity work.myUart(ARCH_myUart)
	GENERIC MAP	(	baudRate => baudRate,
						sysClk 	=> sysClk,
						dataSize => dataSize)
	PORT MAP(
		clk => clk,
		rst => notRst,
		dataWr => dataWr,
		dataTx => dataTx,
		ready => ready,
		tx => tx,
		dataRd => dataRd,
		dataRx => dataRx,
		rx => rx);
		
	Inst_myRegister0:entity work.myRegister(ARCH_myRegister)
	GENERIC MAP( N => dataSize )
	PORT MAP(
		clk => clk,
		rst => notRst,
		save => save0,
		D => Cmd,
		Q => CmdReg);
	
	Inst_myRegister1:entity work.myRegister(ARCH_myRegister)
	GENERIC MAP( N => dataSize )
	PORT MAP(
		clk => clk,
		rst => notRst,
		save => save1,
		D => data0,
		Q => data0Reg);
	
	Inst_myRegister2:entity work.myRegister(ARCH_myRegister)
	GENERIC MAP( N => dataSize )
	PORT MAP(
		clk => clk,
		rst => notRst,
		save => save2,
		D => data1,
		Q => data1Reg);
--++++++++++++++++++++++++++++++++++++++++++++++++++--
end ARCH_mySerialALU;

