library ieee;
use ieee.std_logic_1164.all;

-- defining a register(normal DFF - 1 bit):
entity reg is
 port(
 D : in std_logic;
 CLK : in std_logic;
 RSTn : in std_logic;
 Q : out std_logic
 );
end entity;
architecture reg_arch of reg is
begin
 process(CLK, RSTn)
 begin
 if RSTn = '0' then Q <= '0';
 elsif rising_edge(CLK)then Q <= D;
 end if; 
 end process;
end architecture;


