--TestBench Code

library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is
-- DUT component
component mux8to1 is
port( s : in bit_vector (2 downto 0);
d : in bit_vector (7 downto 0);
y : out bit);
end component;

signal s : bit_vector (2 downto 0);
signal d : bit_vector (7 downto 0);
signal y : bit;

begin
  -- Connect DUT
  DUT: mux8to1 port map(
  s => s,
  d => d,
  y => y );

  process
  begin
    s <= "000";
    d <= "00000001";
    wait for 1 ns;
   
    s <= "001";
    d <= "00000010";
    wait for 1 ns;
   
    s <= "010";
    d <= "00000100";
    wait for 1 ns;   
   
    s <= "011";
    d <= "00001000";
    wait for 1 ns;
    
    s <= "100";
    d <= "00010000";
    wait for 1 ns;
   
    s <= "101";
    d <= "00100000";
    wait for 1 ns;
     
    s <= "110";
    d <= "01000000";
    wait for 1 ns;
          
    s <= "111";
    d <= "10000000";
    wait for 1 ns;    
    wait;
  end process;
end tb;

--Design Code

library IEEE;
use IEEE.std_logic_1164.all;

entity mux8to1 is
port ( s : in bit_vector (2 downto 0);
d : in bit_vector (7 downto 0);
y : out bit);
end mux8to1;

architecture mux of mux8to1 is
begin
with s select
y <= d(0) when "000",
  d(1) when "001",
  d(2) when "010",
  d(3) when "011",
  d(4) when "100",
  d(5) when "101",
  d(6) when "110",
  d(7) when others;
end mux;
