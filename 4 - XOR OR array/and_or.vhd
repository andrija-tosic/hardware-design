library ieee;
use ieee.std_logic_1164.all;


entity and_or is
	generic (n : integer range 0 to 1 := 1);
	port(
		a, b : in std_logic;
		y : out std_logic;
	);
end entity;

architecture arch of and_or is
	begin
    process is
    begin
      if n = 0 then
          y <= a or b;
      else
          y <= a and b;
      end if;
    end process;
end architecture;

