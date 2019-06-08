entity fulladder1_tb is
end entity;

architecture fulladder1_tb_arch of fulladder1_tb is
  component fulladder1 is
    port( x: in bit;
        y: in bit;
        cin: in bit;
        s: out bit;
        cout: out bit);
  end component;
  
  Signal tx,ty,tcin,ts,tcout : bit;
  
  begin
   inst: fulladder1 port map(tx,ty,tcin,ts,tcout);
    
  process
    begin
      tx <= '0';
      ty <= '0';
      tcin <= '0';
      wait for 20ns;
     
      tx <= '0';
      ty <= '1';
      tcin <= '1';
      wait for 20ns;
     
      tx <= '1';
      ty <= '1';
      tcin <= '0';
      wait for 20ns;
     
      tx <= '1';
      ty <= '1';
      tcin <= '1';
      wait for 20ns;
      
      tx <= '0';
      ty <= '0';
      tcin <= '1';
      wait for 20ns;
    
     
end process;
end fulladder1_tb_arch;
