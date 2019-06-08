entity and_tb is
end and_tb;

architecture and_tb_arch of and_tb is

component and_gate is
  Port( a: in bit;
        b: in bit;
        z: out bit
    );
end component;

signal tx,ty,tz : bit;

begin
  inst : and_gate PORT MAP(tx,ty,tz);
process
 begin
   tx <= '0';
   ty <= '0';
   wait for 24ns;
   
   tx <= '0';
   ty <= '1';
   wait for 24ns;
   
   tx <= '1';
   ty <= '0';
   wait for 24ns;
   
   tx <= '1';
   ty <= '1';
   wait for 24ns;
end process;
end architecture;
