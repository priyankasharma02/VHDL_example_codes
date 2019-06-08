Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

Entity boothmul is
    port( mpcd,mplr : in std_logic_vector(4 downto 0);
          start : in std_logic;
          result : out std_logic_vector(9 downto 0));
end entity;

Architecture boothmul_arch of boothmul is
  
    begin
    process(start)
      
    variable acqr : std_logic_vector(9 downto 0);
    variable qn1 : std_logic;
    variable br,nbr : std_logic_vector(4 downto 0);
    
      begin
        if(start 'event and start='1') then
           acqr(9 downto 5) := "00000";
           acqr(4 downto 0) := mpcd;
           qn1 := '0';
           br := mplr;
           nbr := (not br) + '1';
           
      else
          mulloop : for i in 1 to 5 loop
            if(acqr(0)='0' and qn1='1') then
              acqr(9 downto 5) := acqr(9 downto 5) + br;
            elsif(acqr(0)='1' and qn1='0') then
              acqr(9 downto 5) := acqr(9 downto 5) + nbr; 
          end if;
        qn1 := acqr(0);
        acqr(8 downto 0) := acqr(9 downto 1);
    end loop;
    end if;
    result(9 downto 0) <= acqr(9 downto 0);

end process;
end architecture;
          
