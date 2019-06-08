library ieee;
use ieee.std_logic_1164.all;
 
entity FA is
PORT (Cin,A,B: IN STD_LOGIC ;
 Cout,S: OUT STD_LOGIC ) ;
END entity;
 
ARCHITECTURE FA_arch OF FA is
begin
    S <= A XOR B XOR Cin ;
    Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ; 
end architecture;