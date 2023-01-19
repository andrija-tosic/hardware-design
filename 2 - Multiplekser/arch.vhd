-- design

entity mux4 is
    port(
        x1, x2, x3, x4: in integer;
        a, b: in bit;
        y: out integer;
    );
end mux4;

architecture arch of mux4 is
begin
    process(x1, x2, x3, x4, a, b) is
        begin
            if (a, b) = "00" then
                y <= x1;
            elsif (a, b) = "01" then
                y <= x2;
            elsif (a, b) = "10" then
                y <= x3;
            else
                y <= x4;
            end if;
    end process;
end arch;