library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Nothing instantiates this entity, and it is half written. Vanishing is
-- what it must not do: ghdl import reads every *.vhdl file in the workspace,
-- so a half written one is seen even though it is never used.

entity checksum is
   port (value  : in  std_logic_vector (7 downto 0);
         parity : out std_logic);
end checksum;

architecture dataflow of checksum is
begin
   parity <= value(7) xor value(6) xor value(5) xor value(4) xor
end dataflow;
