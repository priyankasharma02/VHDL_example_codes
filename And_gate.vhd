Entity and_gate is
  Port(
    a: in bit;
    b: in bit;
    z: out bit
    );
End and_gate;

Architecture model of and_gate is 
   Begin
     z <= a And b;
 End model;
