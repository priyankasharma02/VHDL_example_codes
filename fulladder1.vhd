entity fulladder1 is
  port( x: in bit;
        y: in bit;
        cin: in bit;
        s: out bit;
        cout: out bit);
end entity;

architecture fulladder1_arch of fulladder1 is
  begin
    s <= x xor y xor cin;
    cout <= (x and y)or(x and cin)or(y and cin);
end fulladder1_arch;
