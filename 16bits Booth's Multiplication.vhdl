--Testbench Code:

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_UNSIGNED.all;
entity testbench is
end testbench;

architecture tb of testbench is
component fullAdder is
port(
   mpcd,mplr:in std_logic_vector(7 downto 0);
   result: out std_logic_vector(15 downto 0));
end component;

signal Mpcd,Mplr:std_logic_vector(7 downto 0);
signal Result: std_logic_vector(15 downto 0);
begin
DUT: fullAdder port map (Mpcd,Mplr,Result);
 process
    begin
     Mpcd <= "00000101";
        Mplr <= "00001010";
        wait for 10 ns;
        Mpcd <= "00001001";
        Mplr <= "00000010";
        wait for 10 ns;
        wait;
        end process;
end tb;

--Design code:

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_UNSIGNED.all;
entity fullAdder is
port(
   mpcd,mplr:in std_logic_vector(7 downto 0);
   result: out std_logic_vector(15 downto 0));
end fullAdder;

architecture temp of fullAdder is

begin
 process(mpcd,mplr)
   variable nbr, br: std_logic_vector(7 downto 0);
   variable acqr: std_logic_vector(15 downto 0);
    variable qn1: std_logic;
 variable i: integer;
 begin
       acqr(15 downto 7) := (others=>'0');
       acqr(7 downto 0) := mplr;
        br:=mpcd;
        nbr:=(not mpcd)+'1';
        qn1:='0';

  for i in 7 downto 0 loop
         if(acqr(0)='0' and qn1='1') then
               acqr(15 downto 8):=acqr(15 downto 8) + br;
            elsif(acqr(0)='1' and qn1='0') then
         acqr(15 downto 8):=acqr(15 downto 8) + nbr;
            end if;
            qn1:=acqr(0);
     acqr(14 downto 0):=acqr(15 downto 1);
         end loop;
         result<=acqr;
 end process;
end temp;
