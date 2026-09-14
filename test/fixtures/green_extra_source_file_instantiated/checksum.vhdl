library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- A second design entity the learner added and wired into the testbench.
-- cyber-dojo.sh runs every entity it finds, so this one is also elaborated
-- and run on its own, with its input port left open.

entity checksum is
   port (value  : in  std_logic_vector (7 downto 0);
         parity : out std_logic);
end checksum;

architecture dataflow of checksum is
begin
   parity <= value(7) xor value(6) xor value(5) xor value(4)
             xor value(3) xor value(2) xor value(1) xor value(0);
end dataflow;
