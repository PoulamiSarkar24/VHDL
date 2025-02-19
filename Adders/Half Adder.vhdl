--Test Bench Code :

library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
--empty
end testbench;

architecture tb of testbench is
--DUTcomponent 
component ha is 
port(
    a:in std_logic;
    b:in std_logic;
    s:out std_logic;
    c:out std_logic);
end component; 
signal a_in,b_in,s_out,c_out:std_logic;
begin
 DUT:ha port map(a_in,b_in,s_out,c_out);
 process
 begin
   	a_in<='0';
	b_in<='0';
	wait for 1ns;
	a_in<='0';
	b_in<='1';
	wait for 1ns;
	a_in<='1';
	b_in<='0';
	wait for 1ns;
	a_in<='1';
	b_in<='1';
	wait for 1ns;
	a_in<='0';
	b_in<='0';
	wait for 1ns;
      wait;
   end process; 
end tb; 

--Design Code :

library IEEE;
use IEEE.std_logic_1164.all;
entity ha is 
port(
	a:in std_logic;
        b:in std_logic;
        s:out std_logic;
        c:out std_logic);
end ha;

architecture rtl of ha is
begin
  process(a,b) is 
  begin
    s<=a xor b;
    c<=a and b;
  end process;
end rtl;
