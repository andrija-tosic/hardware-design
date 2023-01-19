library ieee;
use ieee.std_logic_arith.all;

entity komparator_tb is

end komparator_tb;

architecture test of komparator_tb is
    signal a_in, b_in, y_out: signed(3 downto 0);

    begin
        komp: entity work.komparator(max)
            port map(a_in, b_in, y_out);

        process is
            begin
                a_in <= "0011";
                b_in <= "0101";
                wait;
        end process;
end test;