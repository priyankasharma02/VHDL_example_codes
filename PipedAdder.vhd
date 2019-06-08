library ieee; 
use ieee.std_logic_1164.all; 
 
entity PipedAdder is 
port(A,B: in std_logic_vector(3 downto 0);  
CLK,RSTn,Cin : in std_logic ; 
Cout: out std_logic;  
S: out std_logic_vector(3 downto 0)); 
end entity; 
 
architecture PipedAdder_arch of PipedAdder is 
component FA is
PORT (Cin,A,B: IN STD_LOGIC ;  Cout,S: OUT STD_LOGIC ) ; 
end component; 
 
component reg is
port(D,CLK,RSTn: in std_logic;  Q: out std_logic); 
end component; 

signal tmp_cout : std_logic_vector(3 downto 0);
signal tmp_cin : std_logic_vector(2 downto 0);
signal tmp_S0 : std_logic_vector(3 downto 0);
signal tmp_S1 : std_logic_vector(2 downto 0);
signal tmp_S2 : std_logic_vector(1 downto 0);
signal tmp_S3 : std_logic;
signal tmp_A1 : std_logic;
signal tmp_B1 : std_logic;
signal tmp_A2 : std_logic_vector(1 downto 0);
signal tmp_B2 : std_logic_vector(1 downto 0);
signal tmp_A3 : std_logic_vector(2 downto 0);
signal tmp_B3 : std_logic_vector(2 downto 0);


begin 
 
reg_s0_0: reg port map(tmp_S0(0),CLK,RSTn,tmp_S0(1));
reg_s0_1: reg port map(tmp_S0(1),CLK,RSTn,tmp_S0(2));
reg_s0_2: reg port map(tmp_S0(2),CLK,RSTn,tmp_S0(3));
reg_s0_3: reg port map(tmp_S0(3),CLK,RSTn,S(0));
 
reg_s1_0: reg port map(tmp_S1(0),CLK,RSTn,tmp_S1(1));
reg_s1_1: reg port map(tmp_S1(1),CLK,RSTn,tmp_S1(2));
reg_s1_2: reg port map(tmp_S1(2),CLK,RSTn,S(1));
 
reg_s2_0: reg port map(tmp_S2(0),CLK,RSTn,tmp_S2(1));
reg_s2_1: reg port map(tmp_S2(1),CLK,RSTn,S(2));
 
reg_s3_1: reg port map(tmp_S3,CLK,RSTn,S(3));
 
reg_cout0: reg port map(tmp_cout(0),CLK,RSTn,tmp_cin(0));
reg_cout1: reg port map(tmp_cout(1),CLK,RSTn,tmp_cin(1));
reg_cout2: reg port map(tmp_cout(2),CLK,RSTn,tmp_cin(2));
reg_cout3: reg port map(tmp_cout(3),CLK,RSTn,Cout);
 
reg_A1: reg port map(A(1),CLK,RSTn,tmp_A1);
reg_B1: reg port map(B(1),CLK,RSTn,tmp_B1);
 
reg_A2_0: reg port map(A(2),CLK,RSTn,tmp_A2(0));
reg_B2_0: reg port map(B(2),CLK,RSTn,tmp_B2(0));
reg_A2_1: reg port map(tmp_A2(0),CLK,RSTn,tmp_A2(1));
reg_B2_1: reg port map(tmp_B2(0),CLK,RSTn,tmp_B2(1));
 
reg_A3_0: reg port map(A(3),CLK,RSTn,tmp_A3(0));
reg_B3_0: reg port map(B(3),CLK,RSTn,tmp_B3(0));
reg_A3_1: reg port map(tmp_A3(0),CLK,RSTn,tmp_A3(1));
reg_B3_1: reg port map(tmp_B3(0),CLK,RSTn,tmp_B3(1));
reg_A3_2: reg port map(tmp_A3(1),CLK,RSTn,tmp_A3(2));
reg_B3_2: reg port map(tmp_B3(1),CLK,RSTn,tmp_B3(2));
  
FA_0: FA port map(Cin=>Cin,A=>A(0),B=>B(0),S=>tmp_S0(0),Cout=>tmp_cout(0));
FA_1: FA port map(Cin=>tmp_cin(0),A=>tmp_A1,B=>tmp_B1,S=>tmp_S1(0),Cout=>tmp_cout(1));
FA_2: FA port map(Cin=>tmp_cin(1),A=>tmp_A2(1),B=>tmp_B2(1),S=>tmp_S2(0),Cout=>tmp_cout(2));
FA_3: FA port map(Cin=>tmp_cin(2),A=>tmp_A3(2),B=>tmp_B3(2),S=>tmp_S3,Cout=>tmp_cout(3));
 

 

end architecture;
