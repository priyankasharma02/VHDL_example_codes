Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity bcdadder is
  port( BCDa,BCDb : in std_logic_vector(3 downto 0);
        BCDcin : in std_logic;
        BCDsum : out std_logic_vector(3 downto 0);
        BCDcout : out std_logic);
end entity;

Architecture bcdadder_arch of bcdadder is
  
  Component fulladderplus is
    port( a,b : in std_logic_vector(3 downto 0);
        cin : in std_logic;
        sum : out std_logic_vector(3 downto 0);
        cout : out std_logic);
end component;

Signal s: std_logic_vector(3 downto 0);
Signal carry,c: std_logic;
Signal temp: std_logic;
signal ad: std_logic_vector(3 downto 0);


begin
  
  add : fulladderplus port map(BCDa,BCDb,BCDcin,s,carry);
  temp <= carry or (s(1) and s(3)) or (s(2) and s(3));
  BCDcout <= temp;
  ad <= '0'&temp&temp&'0';
  bcdadd : fulladderplus port map(ad,s,'0',BCDsum,c);
end architecture;
  
  
    
