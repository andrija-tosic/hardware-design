entity dff_test is
    end dff_test;
    
    architecture test of dff_test is
        signal d_in, clk_in, rd_in, q_out: bit;
        
        begin
            uut: entity work.d_flip_flop(sync_reset)
            port map(d_in, rd_in, clk_in, q_out);
            
            clock: process is
            begin
                clk_in <= '0';
                wait for 2 ns;
                clk_in <= '1';
                wait for 2 ns;
            end process;
            
            process is
                begin               
                    d_in <= '0';
                    wait for 1 ns;
                    
                    d_in <= '1';
                    wait for 4 ns;
                    
                    d_in <= '0';
                    wait for 2 ns;
                    
                    d_in <= '1';
                    wait for 4 ns;
                    
                    rd_in <= '1';             
                    
                    wait;
            end process;
    end test;