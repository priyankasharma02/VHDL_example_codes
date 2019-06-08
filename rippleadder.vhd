entity rippleadder is
  port(xin,yin : in bit_vector(7 downto 0);
       carryin : in bit;
       sum : out bit_vector(7 downto 0);
       carryout : out bit);
end entity;

architecture rippleadder_arch of rippleadder is
  component fulladder1 is
    port(x: in bit;
         y: in bit;
         cin: in bit;
         s: out bit;
         cout: out bit);
    end component;
    
    signal tc: bit_vector(8 downto 0);
    
    begin
      tc(0) <= carryin;
      
      inst0: fulladder1 port map(xin(0),yin(0),tc(0),sum(0),tc(1));
      inst1: fulladder1 port map(xin(1),yin(1),tc(1),sum(1),tc(2));
      inst2: fulladder1 port map(xin(2),yin(2),tc(2),sum(2),tc(3));
      inst3: fulladder1 port map(xin(3),yin(3),tc(3),sum(3),tc(4));
      inst4: fulladder1 port map(xin(4),yin(4),tc(4),sum(4),tc(5));
      inst5: fulladder1 port map(xin(5),yin(5),tc(5),sum(5),tc(6));
      inst6: fulladder1 port map(xin(6),yin(6),tc(6),sum(6),tc(7));
      inst7: fulladder1 port map(xin(7),yin(7),tc(7),sum(7),tc(8));
        
      carryout <= tc(8);
      
  end rippleadder_arch;
      
