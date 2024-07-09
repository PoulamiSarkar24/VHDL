--TestBench Code

library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
end testbench;
architecture tb of testbench is
    component demux is
port (s : in std_logic_vector(2 downto 0);
   d : in std_logic;
   o : out std_logic_vector(7 downto 0));
   end component;
   signal A : std_logic_vector(2 downto 0); 
   signal y : std_logic;
   signal B : std_logic_vector(7 downto 0);
begin
   DUT : demux port map (A,y,B);
process
begin
A <= "100";
y <= '1';
wait for 10 ps;
A <= "101";
y <='1';
wait for 10 ps;
wait;
end process;
end tb;

--Design Code

library IEEE;
use IEEE.std_logic_1164.all;
entity demux is
port (s: in std_logic_vector(2 downto 0);
d: in std_logic;
o: out std_logic_vector(7 downto 0));
end demux;
architecture behaviour of demux is
begin	
process(s, d)
begin
    if s = "000" then
      o <= ('0', '0', '0', '0', '0', '0', '0',d);
   elsif s = "001" then
      o <= ('0', '0', '0', '0', '0', '0', d,'0');
   elsif s = "010" then
      o <= ('0', '0', '0', '0', '0', d, '0', '0');
   elsif s = "011" then
      o <= ('0', '0', '0', '0', d, '0', '0', '0');
   elsif s = "100" then
      o <= ('0', '0', '0', d, '0', '0', '0', '0');
   elsif s = "101" then
      o <= ('0', '0', d, '0', '0', '0', '0', '0');
   elsif s = "110" then
      o <= ('0', d, '0', '0', '0', '0', '0', '0');
   elsif s = "111" then
      o <= (d, '0', '0', '0', '0', '0', '0', '0');
   else
      o <= (others => '0');
end if;
        end process;
end behaviour;
