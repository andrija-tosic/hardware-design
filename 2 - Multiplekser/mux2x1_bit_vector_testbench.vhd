library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_tb is

end mux2x1_tb;

architecture tb of mux2x1_tb is
    signal w_in:  bit_vector(3 downto 0);
    signal x_in:  bit_vector(1 downto 0);
    signal y_out: bit;

    begin
        mux: entity work.mux2x1(mux)
            port map(w_in, x_in, y_out);

        process is
        begin
            w_in <= "1000";
            x_in <= "00"; -- y = 1
            wait for 1 ns;

            x_in <= "11"; -- y = 0

            wait;
        end process;
end tb;