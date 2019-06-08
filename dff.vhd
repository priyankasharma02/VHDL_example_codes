Entity dff is 
  port(din,reset,clk : in bit;
        qout : out bit);
end entity;

Architecture dff_arch of dff is 
  Begin
    
    process(reset,clk)
      begin
        if(reset = '1') then
          qout <= '0';
      elsif(clk 'event and clk = '1') then
          qout <= din;
    end if;
end process;
end architecture;
         
