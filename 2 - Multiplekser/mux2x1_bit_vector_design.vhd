library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
    port(
        w: in  bit_vector(3 downto 0); -- 4 bita na ulaz
        x: in  bit_vector(1 downto 0); -- 2 bita za izbor
        y: out bit; -- izabrani bit
    );
end entity;

architecture mux of mux2x1 is
    begin process(w, x, y) is
            begin
                if x = "00" then
                    y <= w(0);
                elsif x = "01" then
                    y <= w(1);
                elsif x = "10" then
                    y <= w(2);
                else
                    y <= w(3);
                end if;
            end process;
end mux;