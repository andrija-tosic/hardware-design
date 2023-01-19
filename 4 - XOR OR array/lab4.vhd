library ieee;
use ieee.std_logic_1164.all;

entity or_kolo is
	port(
		a, b : in std_logic;
		y : out std_logic;
	);
end entity;

architecture or_arch of or_kolo is
	begin
	y <= a or b;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity xor_kolo is
	port(
		a, b : in std_logic;
		y : out std_logic;
	);
end entity;

architecture xor_arch of xor_kolo is
	begin
	y <= a xor b;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity xor_or is
	generic (n : integer := 4);
	port(
		a : in std_logic;
		b, c : in std_logic_vector (n-1 downto 0);
		y : out std_logic_vector (n-1 downto 0);
		);
end xor_or;

architecture arch of xor_or is
	signal y_xor : std_logic_vector(n-1 downto 0); -- izlaz xor kola
	signal y_a : std_logic_vector(n downto 0); -- signal koji povezuje
    -- prosli izlaz, izlaz OR kola sa prvim ulazom u sledece
    -- XOR kolo
	begin
	y_a(0) <= a; -- prvi ulaz se razlikuje od ostalih
	g1: for i in 0 to n-1 generate
		e1: entity work.xor_kolo(xor_arch)
			port map(y_a(i), b(i), y_xor(i));
			
		e2: entity work.or_kolo(or_arch)
			port map(y_xor(i), c(i), y_a(i+1));
            
        y(i) <= y_a(i+1); -- izlaz kola
    end generate;
end arch;

library ieee;
use ieee.std_logic_1164.all;

entity tb is
	generic(
    br : integer := 4;
    br2 : integer := 2;
    );
end tb;

architecture tb_arch of tb is
	signal a : std_logic;
    signal b, c : std_logic_vector (br-1 downto 0);
	signal y : std_logic_vector (br-1 downto 0);
    
    signal a2 : std_logic;
    signal b2, c2 : std_logic_vector (br2-1 downto 0);
	signal y2 : std_logic_vector (br2-1 downto 0);
    
    begin
	uut1: entity work.xor_or(arch)
    
        generic map(n => br)
        port map(a, b, c, y);
        
    	process is
        begin
        	a <= '1';
            b <= "1011";
            c <= "1010";
			wait for 1 ns;
            a <= '0';
            b <= "1111";
            c <= "0100";
            wait for 1 ns;
            a <= '0';
            b <= "0000";
            c <= "0100";
            wait for 1 ns;
            a <= '0';
            b <= "0000";
            c <= "0000";
            wait for 1 ns;
            a <= '1';
            b <= "0000";
            c <= "0100";
            wait;
        end process;
        
        uut2: entity work.xor_or(arch)
        generic map(n => br2)
        port map(a2, b2, c2, y2);
        
        process is
        begin
        	a2 <= '1';
            b2 <= "11";
            c2 <= "10";
			wait for 1 ns;
            a2 <= '0';
            b2 <= "11";
            c2 <= "00";
            wait for 1 ns;
            a2 <= '0';
            b2 <= "00";
            c2 <= "00";
            wait for 1 ns;
            a2 <= '0';
            b2 <= "00";
            c2 <= "00";
            wait for 1 ns;
            a2 <= '1';
            b2 <= "00";
            c2 <= "01";
            wait;
        end process;
end tb_arch;
