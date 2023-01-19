library ieee;
use ieee.std_logic_1164.all;

	
entity pin is
	generic (n : integer := 8);
	port(
	S : in std_logic;
	data : in std_logic_vector(n-1 downto 0);
	y : out std_logic_vector(n-1 downto 0);
	);
end entity;

architecture pin_arch of pin is
	begin
    e3: entity work.n_bitni_komparator(n_arch)
		generic map(n)
		port map(data, data, y);
    process is
    variable d : std_logic_vector(n-1 downto 0);
    begin
		if S = '1' then
			d := data;
		end if;
    end process;
end architecture;
