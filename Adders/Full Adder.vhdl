--Testbench Code:

library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT component
component full_adder is
port(
  a: in std_logic;
  b: in std_logic;
  c: in std_logic;
  sum,carry: out std_logic);
end component;

signal a_in, b_in,c_in, sum_out,carry_out: std_logic;
begin
  -- Connect DUT
  DUT:full_adder port map(a_in, b_in, c_in, sum_out,carry_out);

  process
  begin
    a_in <= '0';
    b_in <= '0';
    c_in <= '0';
    wait for 1 ns;
 
    a_in <= '0';
    b_in <= '0';
    c_in <= '1';
    wait for 1 ns;

    a_in <= '0';
    b_in <= '1';
    c_in <= '0';
    wait for 1 ns;
   
    a_in <= '0';
    b_in <= '1';
    c_in <= '1';
    wait for 1 ns;
   
    a_in <= '1';
    b_in <= '0';
    c_in <= '0';
    wait for 1 ns;

    a_in <= '1';
    b_in <= '0';
    c_in <= '1';
    wait for 1 ns;
   
    a_in <= '1';
    b_in <= '1';
    c_in <= '0';
    wait for 1 ns;

    a_in <= '1';
    b_in <= '1';
    c_in <= '1';
    wait for 1 ns;

    -- Clear inputs
    a_in <= '0';
    b_in <= '0';
    c_in <= '0';

    wait;
  end process;
end tb;

--Design Code:

library IEEE;
use IEEE.std_logic_1164.all;
entity full_adder is
port(
	a: in std_logic;
	b: in std_logic;
	c: in std_logic;
sum,carry: out std_logic);
end full_adder;
architecture rtl of full_adder is
begin
	process(a,b,c) is
    begin
		sum <= a xor b xor c;
		carry <= (c and (a xor b))or (a and b);
	end process;
end rtl;
