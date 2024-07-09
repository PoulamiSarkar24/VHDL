--Testbench Code:

library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

    component ripple_adder is
  	Port (
            A : in STD_LOGIC_VECTOR (7 downto 0);
  	B : in STD_LOGIC_VECTOR (7 downto 0);
  	C_in : in STD_LOGIC;
  	Sum : out STD_LOGIC_VECTOR (7 downto 0);
  	C_out : out STD_LOGIC);
      end component;

      signal A: STD_LOGIC_VECTOR (7 downto 0);
      signal B: STD_LOGIC_VECTOR (7 downto 0);
      signal C_in: STD_LOGIC;
      signal Sum: STD_LOGIC_VECTOR (7 downto 0);
      signal C_out: STD_LOGIC;

      begin
      -- Connect DUT
      DUT: ripple_adder port map(A,B,C_in,Sum,C_out);

      process
   	 begin
   		A <= “00100101";
   		B <= "00110110";
        		C_in <= '1';
        		wait for 100 ns;
       	
        		A <= "01011001";
     	   	B <= "00110110";
     	   	C_in <= '1';
   	     	wait for 100 ns;
       	
 	       	A <= "01100110";
        		B <= "00110110";
        		C_in <= '1';
        		wait for 100 ns;

        	A <= "11110000";
        		B <= "00001111";
        		C_in <= '1';
        		wait for 100 ns;

        		A <= "11110000";
        		B <= "11110000";
        		C_in <= '1';
        		wait for 100 ns;
        	wait;
           end process;
end tb;

--Design Code:

library IEEE;
use IEEE.std_logic_1164.all;
entity ripple_adder is
port(
	A : in STD_LOGIC_VECTOR(7 downto 0);
	B : in STD_LOGIC_VECTOR(7 downto 0);
	C_in : in STD_LOGIC;
	Sum : out STD_LOGIC_VECTOR(7 downto 0);
	C_out:out STD_LOGIC);
end ripple_adder;
architecture ripplearch of ripple_adder is
signal c : STD_LOGIC_VECTOR(8 downto 0);
begin
	process(A,B,C_in,c)
	variable i : integer;
	begin
		c(0) <= C_in;
		for i in 0 to 7 loop
		Sum(i) <= a(i) xor b(i) xor c(i);
		c(i+1) <= (A(i) and B(i)) or (A(i) and c(i)) or (c(i) and B(i));
	end loop;
C_out <= c(8);
end process;
end ripplearch;
