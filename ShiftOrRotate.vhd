entity ShiftOrRotate is
generic
(
	bits: integer:=8
);


  port( 
	input: in bit_vector(bits-1 downto 0);
	sel: in bit_vector(1 downto 0);
	output: out bit_vector(bits-1 downto 0)
   );
end entity;

architecture ShiftOrRotate_arch of ShiftOrRotate is
begin

process(sel) 
begin
	case sel is
		when "00"=>
			output(bits-1 downto 0)<= input(bits-2 downto 0)&'0';  --Shift Left
		when "01"=>
			output(bits-1 downto 0)<= input(bits-1) & input(bits-1 downto 1);  --Shift Right
		when "10"=>
			output(bits-1 downto 0)<= input(bits-2 downto 0)& input(bits-1);  --Rotate Left
		when "11"=>
			output(bits-1 downto 0)<= input(0) & input(bits-1 downto 1);   --Rotate Right
	end case;
end process;

end architecture;


