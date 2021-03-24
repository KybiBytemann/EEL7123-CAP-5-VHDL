library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity top is

	port(
    C: in std_logic;
		A: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(10 downto 0)
	 );
end top;

architecture Structural of top is

  signal entryAdder_A, entryAdder_B1, entryAdder_B2: std_logic_vector(7 downto 0);
  signal entryAdder_B0: std_logic_vector(7 downto 0);
  signal resultAdder_R: std_logic_vector(8 downto 0);

  component adder8 is
    port(
      signal_cin: in std_logic;
      operand_a, operand_b: in std_logic_vector(7 downto 0);
      result: out std_logic_vector(8 downto 0)
    );
  end component;

  component mux_long is
    port(
      switch_long: in std_logic;
      entry_long_x, entry_long_y: in std_logic_vector(7 downto 0);
		  mux_long_out: out std_logic_vector(7 downto 0)
	  );
  end component;

  component mux is
    port(
      switch: in std_logic;
      entry_x, entry_y: in std_logic;
      mux_out: out std_logic
    );
  end component;

  begin

    entryAdder_A <= '0' & A(2) & A(3) & A(2) & A(1) & A(0) & A(3) & A(2);
    entryAdder_B1 <= A(3) & '0' & A(1) & A(0) & A(3) & A(2) & A(1) & A(0);
    entryAdder_B2 <= '0' & A(3) & (not(A(2)) and '1') & A(1) & A(0) & "011";

    U0: mux_long port map(switch_long=> C, entry_long_x=> entryAdder_B1, entry_long_y=> entryAdder_B2, mux_long_out=> entryAdder_B0);
	  U1: adder8 port map(operand_a => entryAdder_A, operand_b=> entryAdder_B0, signal_cin=> '0', result=> resultAdder_R(8 downto 0));

    S(1 downto 0) <= A(1 downto 0);
    S(9 downto 2) <= resultAdder_R(7 downto 0);
	  S(10) <= (C or resultAdder_R(8));

end Structural;
