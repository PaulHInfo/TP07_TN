-- a
library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity ent is
  port (
    a,b,c : in std_logic;
    s : out std_logic
  ) ;
end ent ; 

architecture arch of ent is
    
begin
 
  process a: process (a,b,c)
  begin
  s <= (not (b) and c) or (not (a)and b or not (c))
  end process    
end architecture ent;
