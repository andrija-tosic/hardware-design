entity jk_ff_test is
end jk_ff_test;

architecture test of jk_ff_test is
    signal j_in, k_in, clk_in, rd_in, q_in: bit;

    begin
        uut: entity work.jk_flip_flop(async_reset)
            port map(j_in, k_in, clk_in, rd_in, q_in);
    
        clock_in: process is
            begin
                clk_in <= '0';
                wait for 2 ns;
                clk_in <= '1';
                wait for 2 ns;
        end process;
        
        process is
            begin
                j_in <= '0';
                k_in <= '0';
                wait for 3 ns;
                
                j_in <= '1';
                k_in <= '0';
                wait for 6 ns;
                
                
                j_in <= '0';
                k_in <= '1';
                wait for 2 ns;
                    
                j_in <= '1';
                k_in <= '1';
                wait for 4 ns;
                
                j_in <= '0';
                wait for 2 ns;
                    
                rd_in <= '1';             
                    
                wait;
        end process;
end test;