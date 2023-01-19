-- testbench

entity mux4_tb is
end mux4_tb;

architecture test of mux4_tb is
    signal x1_in, x2_in, x3_in, x4_in: integer;
    signal a_in, b_in: bit;
    signal y_out: integer;
    begin
        uut: entity work.mux4(arch)
    port map(x1_in, x2_in, x3_in, x4_in, a_in, b_in, y_out);

    process is
        begin
            x1_in <= 2;
            x2_in <= 3;
            x3_in <= -4;
            x4_in <= 1;

            a_in <= '0';
            b_in <= '0';

            wait for 1 ns;

            a_in <= '0';
            b_in <= '1';

            wait for 1 ns;

            a_in <= '1';
            b_in <= '0';

            wait for 1 ns;

            a_in <= '1';
            b_in <= '1';
            
            wait for 1 ns;
            
            x1_in <= 5;
            x2_in <= 0;
            x3_in <= 25;
            
            wait for 1 ns;
            
            x4_in <= 6;
            
            wait;
    end process;
end test;