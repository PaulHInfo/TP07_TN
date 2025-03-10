library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity ent_struct is
  port (
    i_B, i_C, ic_clk, i_rst : in STD_LOGIC;
    i_out : out STD_LOGIC;
  ) ;
  end ent_struct ; 
  architecture Arch_struct of ent_Struct is
  Ent_1 : entity work.Ent_combi(Arch_combi)
    port map(
        A => A_intern;
        B => i_B;
        C => i_C;
        D => B_intern;
    )
  --Ent_2 : entity work.Ent_Rg
    port map(
        K => A_intern;
        B => i_B;
        C => i_C;
        D => B_intern;
    )

architecture arch of ent_struct is
    signal : A_intern, B_intern : STD_LOGIC;
begin

begin

end architecture ;