--Testbench code:

library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;
architecture tb of testbench is
component addsub is
port (
    a, b: in std_logic_vector(7 downto 0);
	c_in, mode: in std_logic;
	c_out: out std_logic;
	sum: out std_logic_vector(7 downto 0));
end component;

signal a, b, sum: std_logic_vector(7 downto 0);
signal c_in, c_out, mode: std_logic;

begin
DUT: addsub port map (a, b, c_in, mode, c_out, sum);
	process
	begin
   	    a <= "00001001";
     	b <= "00000100";
    	c_in <= '0';
    	mode <= '0';
    	wait for 100ns;
   	    	    a <= "00001001";
    	b <= "00000100";
    	c_in <= '1';
    	mode <= '1';
    	wait for 100ns;
   	    	a <= "00000100";
    	b <= "00001001";
    	c_in <= '1';
    	mode <= '1';
    	wait for 100ns;
    	wait;
	end process;
end tb;

--Design code:

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity addsub is
port (
    a, b: in std_logic_vector(7 downto 0);
	c_in, mode: in std_logic;
	c_out: out std_logic;
	sum: out std_logic_vector(7 downto 0));
end addsub;

architecture addsub_arch of addsub is
signal c: std_logic_vector(8 downto 0);
	begin
	process (a, b, c_in, c, mode)
    variable i: integer;
   	 begin
    	if mode = '1' then
   		 c(0) <= c_in or mode;
    	else
   		 c(0) <= c_in;
    	end if;
   	
    	for i in 0 to 7 loop
   		 sum(i) <= a(i) xor (b(i) xor mode) xor c(i);
        	c(i+1) <= (a(i) and (b(i) xor mode)) or ((b(i) xor mode) and c(i)) or (c(i) and a(i));
    	end loop;
    	c_out <= c(8);
	end process;
end addsub_arch;
