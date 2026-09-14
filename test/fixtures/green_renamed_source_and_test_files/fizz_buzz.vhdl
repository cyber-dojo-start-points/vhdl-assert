library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fizz_buzz is
   port (meaning_of_life : out std_logic_vector (7 downto 0));
end fizz_buzz;

architecture dataflow of fizz_buzz is
begin
   meaning_of_life <= "00101010";  -- 42
end dataflow;
