entity adder_forgenerate_tb is
end entity;

architecture adder_forgenerate_tb_arch of adder_forgenerate_tb is
  component adder_forgenerate is
    port(xin,yin : in bit_vector(7 downto 0);
       carryin : in bit;
       sum : out bit_vector(7 downto 0);
       carryout : out bit);
  end component;
  
  signal txin,tyin,tsum : bit_vector(7 downto 0);
  signal tcarryin,tcarryout : bit;
  
  begin
   inst: adder_forgenerate port map(txin,tyin,tcarryin,tsum,tcarryout);
    
  process
    begin
      txin <= "00000000";
      tyin <= "11111111";
      tcarryin <= '0';
      wait for 20ns;
     
      txin <= "11111111";
      tyin <= "11111111";
      tcarryin <= '0';
      wait for 20ns;
     
      txin <= "00001111";
      tyin <= "11110000";
      tcarryin <= '1';
      wait for 20ns;
     
      txin <= "11001100";
      tyin <= "11001100";
      tcarryin <= '1';
      wait for 20ns;
      
      txin <= "10101010";
      tyin <= "01010101";
      tcarryin <= '0';
      wait for 20ns;
    
     
end process;
end adder_forgenerate_tb_arch;
 


