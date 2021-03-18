library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity adder8 is

	port(
		signal_cin: std_logic;
    operand_a, operand_b: in std_logic_vector(7 downto 0);
    result: out std_logic_vector(8 downto 0)
	 );
end adder8;

architecture Structural of adder8 is

  signal aux0, aux1, aux2, aux3: std_logic;
  signal aux4, aux5, aux6: std_logic;

  component full_adder is
    port(
      A: in std_logic;
      B: in std_logic;
      Cin: in std_logic;
      S: out std_logic;
      Cout: out std_logic
    );
  end component;

  begin

		U0: full_adder port map(A => operand_a(0), B=> operand_b(0), Cin=> signal_cin, S=> result(0), Cout=> aux0);
    U1: full_adder port map(A => operand_a(1), B=> operand_b(1), Cin=> aux0, S=> result(1), Cout=> aux1);
    U2: full_adder port map(A => operand_a(2), B=> operand_b(2), Cin=> aux1, S=> result(2), Cout=> aux2);
    U3: full_adder port map(A => operand_a(3), B=> operand_b(3), Cin=> aux2, S=> result(3), Cout=> aux3);
    U4: full_adder port map(A => operand_a(4), B=> operand_b(4), Cin=> aux3, S=> result(4), Cout=> aux4);
    U5: full_adder port map(A => operand_a(5), B=> operand_b(5), Cin=> aux4, S=> result(5), Cout=> aux5);
    U6: full_adder port map(A => operand_a(6), B=> operand_b(6), Cin=> aux5, S=> result(6), Cout=> aux6);
    U7: full_adder port map(A => operand_a(7), B=> operand_b(7), Cin=> aux6, S=> result(7), Cout=> result(8));

end Structural;
