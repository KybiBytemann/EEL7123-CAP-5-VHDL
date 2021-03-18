library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity mux_long is
	port(
		switch_long: in std_logic;
		entry_long_x, entry_long_y: in std_logic_vector(7 downto 0);
		mux_long_out: out std_logic_vector(7 downto 0)
	);
end mux_long;

architecture behavior of mux_long is

begin
	process(entry_long_x, entry_long_y,switch_long)
	begin
		if switch_long = '0' then
      mux_long_out <= entry_long_x;
    else
      mux_long_out <= entry_long_y;
    end if;
	end process;

end behavior;
