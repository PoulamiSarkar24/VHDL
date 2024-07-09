--TestBench Code

library IEEE;
use IEEE.std_logic_1164.all;
 entity testbench is
end testbench;
architecture tb of testbench is  
component encoder is
port (d: in std_logic_vector(7 downto 0);
o: out std_logic_vector(2 downto 0));
 end component;
signal A : std_logic_vector(7 downto 0);
 signal B : std_logic_vector(2 downto 0);
 begin
DUT : encoder port map (A,B); 
process
begin
A <= "00100000";
wait for 10 ns;
 A <= "10000000";
wait for 10 ns; 
wait;
end process;
 end tb;

--Design Code

library IEEE;
use IEEE.std_logic_1164.all; 
entity encoder is
port (d: in std_logic_vector(7 downto 0);
         o: out std_logic_vector(2 downto 0));
 end encoder;
architecture behaviour of encoder is
 begin
process(d) 
begin
if d = "00000001" then  o <= ('0', '0','0');
elsif d = "00000010" then  o <= ('0','0', '1');
elsif d = "00000100" then  o <= ('0','1', '0');
elsif d = "00001000" then  o <= ('0','1', '1');
elsif d = "00010000" then  o <= ('1','0', '0');
elsif d = "00100000" then  o <= ('1','0', '1');
elsif d = "01000000" then  o <= ('1','1', '0');
else
o <= ('1','1','1');
end if;
end process;
 end behaviour;
