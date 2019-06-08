entity ShiftOrRotate_tb is
end entity;

architecture ShiftOrRotate_tb_arch of ShiftOrRotate_tb is

component ShiftOrRotate is
generic
(
	bits: integer:=8
);

port( 
	input: in bit_vector(bits-1 downto 0);
	sel: in bit_vector(1 downto 0);
	output: out bit_vector(bits-1 downto 0)
   );
end component;

signal tinput,toutput: bit_vector(7 downto 0);

signal tsel: bit_vector(1 downto 0);

begin
inst: ShiftOrRotate port map(tinput,tsel,toutput);

process 
  begin
  tinput <="11001010";
  tsel<="00";
  wait for 20 ns;
  
  tsel<="01";
  wait for 20 ns;

  tsel<="10";
  wait for 20 ns;

  tsel<="11";
  wait for 20 ns;
  
  tinput <="10101001";
  tsel<="00";
  wait for 20 ns;
  
  tsel<="10";
  wait for 20 ns;
  
  tsel<="11";
  wait for 20 ns;
  
end process;
end architecture;

