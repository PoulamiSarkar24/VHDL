--TestBench Code

library IEEE;
use IEEE.std_logic_1164.all;
 entity decoder is
port (a,b,c: in std_logic;
        d: out std_logic_vector(7 downto 0)); 
end decoder;

architecture behaviour of decoder is 
begin
process(a,b,c)
 begin
d(0) <= (not a)and(not b)and(not c);
 d(1) <= (not a)and(not b)and(c);
d(2) <= (not a)and(b)and(not c);
d(3) <= (not a)and(b)and(c);
d(4) <= (a)and(not b)and(not c);
d(5) <= (a)and(not b)and(c);
d(6) <= (a)and(b)and(not c);
d(7) <= (a)and(b)and(c);
 end process;
end behaviour;

--Design Code

library IEEE;
use IEEE.std_logic_1164.all; 
entity testbench is

end testbench;
architecture tb of testbench is component decoder is
port(
a,b,c: in std_logic;
d: out std_logic_vector(7 downto 0)); 
end component;
signal a,b,c : std_logic;
signal d : std_logic_vector(7 downto 0);

begin
DUT : decoder port map (a,b,c,d); 
process
begin
a <= '0';
b <= '0';
c <= '0';
wait for 10 ps;
a <= '0';
b <= '1';
c <= '0';
wait for 10 ps;
a <= '0';
b <= '0';
c <= '1';
wait for 10 ps; 
wait;
end process; 
end tb;
