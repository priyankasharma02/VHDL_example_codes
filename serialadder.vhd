Entity serialadder is
  port(sax,say,saclk,sareset : in bit;
          saout: out bit);
      end entity;
      
Architecture serialadder_arch of serialadder is 
  Component fulladder1 is
     port( x: in bit;
        y: in bit;
        cin: in bit;
        s: out bit;
        cout: out bit);
  end component;
  
  Component dff is
    port(din,reset,clk : in bit;
        qout : out bit);
  end component;
  
  Signal tcin,tcout : bit;
  
  Begin
    inst0: fulladder1 port map(sax,say,tcin,saout,tcout);
    inst1: dff port map(tcout,sareset,saclk,tcin);
      
end architecture;
  
  
