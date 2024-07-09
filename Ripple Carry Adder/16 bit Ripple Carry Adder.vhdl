--TestBench Code

library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is
--empty
end testbench;
architecture tb of testbench is

component complex is
port( a : in std_logic_vector(15 downto 0);
b : in std_logic_vector(15 downto 0);
sum : out std_logic_vector(15 downto 0);
C_in : in std_logic;
C_out : out std_logic
);
end component;
signal a : std_logic_vector(15 downto 0);
signal b : std_logic_vector(15 downto 0);
signal sum : std_logic_vector(15 downto 0);
signal C_in : std_logic;
signal C_out : std_logic;
begin
DUT : complex port map(a, b, sum, C_in, C_out);
process
begin
a <= "0010100110100001";
b <= "0100110101000101";
C_in <= '0';
wait for 100 ns;
a <= "1001001000010011";
b <= "0101001110011010";
C_in <= '1';
wait for 100 ns;
wait;
end process;
end tb;

--Design Code

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity complex is
port(
a : in std_logic_vector(15 downto 0);
b : in std_logic_vector(15 downto 0);
sum : out std_logic_vector(15 downto 0);
C_in : in std_logic;
C_out: out std_logic;
);
end complex;
architecture behavioral of complex is
signal c1,c2,c3,c4 : std_logic_vector(4 downto 0);
signal a0,a1,a2,a3,b0,b1,b2,b3,p0,p1,sum0,sum1,sum2,sum3,g0,g1 : std_logic_vector(3 downto 0);
begin
process(a,b,C_in,c1,c2,c3,c4,a0,a1,a2,a3,b0,b1,b2,b3,p0,p1,sum0,sum1,sum2,sum3,g0,g1)
variable i : integer;
begin
c1(0) <= C_in;
  a0(3 downto 0) <= a(3 downto 0);
  a1(3 downto 0) <= a(7 downto 4);
  a2(3 downto 0) <= a(11 downto 8);
  a3(3 downto 0) <= a(15 downto 12);
  b0(3 downto 0) <= b(3 downto 0);
  b1(3 downto 0) <= b(7 downto 4);
  b2(3 downto 0) <= b(11 downto 8);
  b3(3 downto 0) <= b(15 downto 12);

--code for 1st CLA
for i in 0 to 3 loop
  p0(i) <= a0(i) xor b0(i);
  g0(i) <= a0(i) and b0(i);
  sum0(i) <= p0(i) xor c1(i);
  c1(i + 1) <= g0(i) or (p0(i) and c1(i));
end loop;
--forward the carry
c2(0) <= c1(4);

--code for second CLA
for i in 0 to 3 loop
  p1(i) <= a1(i) xor b1(i);
  g1(i) <= a1(i) and b1(i);
  sum1(i) <= p1(i) xor c2(i);
  c2(i + 1) <= g1(i) or (p1(i) and c2(i));
end loop;
c3(0) <= c2(4);

--code for third RCA
for i in 0 to 3 loop
  sum2(i) <= a2(i) xor b2(i) xor c3(i);
  c3(i + 1) <= (a2(i) and b2(i)) or (a2(i) and c3(i)) or (b2(i) and c3(i));
end loop;
c4(0) <= c3(4);

--code for fourth RCA
for i in 0 to 3 loop
  sum3(i) <= a3(i) xor b3(i) xor c4(i);
  c4(i + 1) <= (a3(i) and b3(i)) or (a3(i) and c4(i)) or (b3(i) and c4(i));
end loop;
C_out <= c4(4);
sum(3 downto 0) <= sum0(3 downto 0);
sum(7 downto 4) <= sum1(3 downto 0);
sum(11 downto 8) <= sum2(3 downto 0);
sum(15 downto 12) <= sum3(3 downto 0);
end process;
end behavioral;
