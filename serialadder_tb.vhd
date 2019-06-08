Entity serialadder_tb is
end entity;

Architecture serialadder_tb_arch of serialadder_tb is
  Component serialadder is
    port(sax,say,saclk,sareset : in bit;
          saout: out bit);
end Component;

Signal tsax,tsay,tsaout : bit;
Signal tsaclk : bit;
Signal tsareset : bit;

Begin 
  inst : serialadder port map(tsax,tsay,tsaclk,tsareset,tsaout);
    process
      begin
        
        tsaclk <= '1';
        wait for 20 ns;
        tsaclk <= '0';
        wait for 10 ns;
    end process;
    
    process
      begin
        
        tsareset <= '1';
        wait for 10 ns;
        
        tsareset <= '0';
        tsax <= '0';
        tsay <= '0';
        wait for 10 ns;
        
        tsax <= '0';
        tsay <= '1';
        wait for 10 ns;
        
        tsax <= '1';
        tsay <= '0';
        wait for 10 ns;
        
        tsax <= '1';
        tsay <= '1';
        wait for 10 ns;
        
  end process;
end architecture;
