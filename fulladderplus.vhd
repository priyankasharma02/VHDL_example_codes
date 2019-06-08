Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity fulladderplus is
  port( a,b : in std_logic_vector(3 downto 0);
        cin : in std_logic;
        sum : out std_logic_vector(3 downto 0);
        cout : out std_logic);
end entity;

Architecture fulladderplus_arch of fulladderplus is
  
  Signal temp: std_logic_vector(4 downto 0);
  begin
    temp <= ('0'&a)+(b)+(cin);
    sum <= temp(3 downto 0);
    cout <= temp(4);
end architecture;
    
