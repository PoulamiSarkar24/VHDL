--Testbench code:

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
--empty
end testbench;

architecture tb of testbench is
  component carryLookAhead is
  port(
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    C_in : in std_logic;
    Sum : out std_logic_vector(3 downto 0);
    C_out: out std_logic
  );
  end component;

  signal A: std_logic_vector(3 downto 0);
  signal B: std_logic_vector(3 downto 0);
  signal C_in : std_logic;
  signal Sum: std_logic_vector(3 downto 0);
  signal C_out :std_logic;
   
  begin
    DUT: carryLookAhead port map(A,B,C_in,Sum,C_out);
    process
    	begin
      	A <= "0110";
      	B <= "1100";
      	C_in <= '1';
      	wait for 100 ns;
          	A <= "1111";
      	B <= "1100";
      	C_in <= '1';
      	wait for 100 ns;
      	          A <= "0110";
      	B <= "0111";
      	C_in <= '1';
      	wait for 100 ns;
           	A <= "0110";
      	B <= "1110";
      	C_in <= '1';
      	wait for 100 ns;
           	A <= "1111";
      	B <= "1100";
      	C_in <= '1';
      	wait for 100 ns;
           	A <= "1111";
      	B <= "1111";
      	C_in <= '1';
      	wait for 100 ns;

  		wait;
  	end process;
  end tb;

  --Design Code:

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity carryLookAhead is
  port ( A    : in  std_logic_vector(3 downto 0);
    B    : in  std_logic_vector(3 downto 0);
    C_in : in  std_logic;
    Sum  : out std_logic_vector(3 downto 0);
    C_out: out std_logic
  );
end carryLookAhead;

architecture ClaArch of carryLookAhead is
  signal P: std_logic_vector(3 downto 0);
  signal G: std_logic_vector(3 downto 0);
  signal C: std_logic_vector(4 downto 0);
begin
  process(A, B, C_in,P,G,C)
  begin
    C(0) <= C_in;
    for i in 0 to 3 loop
      P(i) <= A(i) xor B(i);
      G(i) <= A(i) and B(i);
      Sum(i) <= P(i) xor C(i);
      C(i+1) <= G(i) or (P(i) and C(i));
    end loop;
    C_out<= C(4);
  end process;
end ClaArch;
