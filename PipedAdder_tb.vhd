Library ieee;
Use ieee.std_logic_1164.all;

entity PipedAdder_tb is
end entity;

Architecture PipedAdder_tb_arch of PipedAdder_tb is
  
  Component PipedAdder is
    port(A,B: in std_logic_vector(3 downto 0);  
         CLK,RSTn,Cin : in std_logic ; 
         Cout: out std_logic;  
         S: out std_logic_vector(3 downto 0)); 
    end Component;
    
    Signal tA,tB,tS : std_logic_vector(3 downto 0);
    Signal tCin,tCout : std_logic;
    Signal tclk: std_logic;
    Signal trst : std_logic;
  Begin
    
    inst0: PipedAdder port map(tA,tB,tclk,trst,tCin,tCout,tS);
      
      Process
        Begin
          
          tclk <= '1';
          wait for 20 ns;
          tclk <= '0';
          wait for 20 ns;
          
        end process;
        
      process
        begin
          
       trst <= '0';
       wait for 10 ns;
       
       trst <= '1';   
          
      tA <= "0000";
      tB <= "1111";
      tCin <= '0';
      wait for 20ns;
     
      tA <= "1111";
      tB <= "1111";
      tCin <= '0';
      wait for 20ns;
      
    end process;
end architecture;
          

