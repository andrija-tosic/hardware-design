library ieee;
use ieee.std_logic_1164.all;

entity tb is
	generic (br : integer := 4);
end tb;

architecture tb_arch of tb is
	signal a, b, c, y : std_logic_vector (br-1 downto 0);
	
    
    begin
	uut: entity work.xor_or(arch)
    
        generic map(n => br)
        port map(a, b, c, y);
    
    	process is
        begin
        	a <= "1010";
            b <= "0000";
            c <= "0000";
			wait for 1 ns;
            a <= "0101";
            b <= "0000";
            c <= "0000";
            wait for 1 ns;
            wait;
        end process;
end tb_arch;
