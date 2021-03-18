library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity mux is
	port(
		switch: in std_logic;
		entry_x, entry_y: in std_logic;
		mux_out: out std_logic
	);
end mux;

architecture behavior of mux is

begin
	process(entry_x, entry_y,switch)
	begin
		if switch = '0' then
      mux_out <= entry_x;
    else
      mux_out <= entry_y;
    end if;
	end process;

end behavior;
