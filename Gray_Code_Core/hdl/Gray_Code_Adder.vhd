--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: Gray_Code_Adder.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::144 TQ>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.Gray_Code_package.all;

entity Gray_Code_Adder is
generic (
	g_n_bits : natural := 8
);
port (
    gray_a : in std_logic_vector(g_n_bits - 1 downto 0);
    gray_b : in std_logic_vector(g_n_bits - 1 downto 0);

    gray_c : out std_logic_vector(g_n_bits - 1 downto 0)
);
end Gray_Code_Adder;
architecture architecture_Gray_Code_Adder of Gray_Code_Adder is

    signal bin_a, bin_b, bin_c : std_logic_vector(g_n_bits - 1 downto 0);

begin

    bin_a <= f_Gray_to_Binary(gray_a);
    bin_b <= f_Gray_to_Binary(gray_b);

    bin_c <= std_logic_vector(unsigned(bin_a) + unsigned(bin_b));
    gray_c <= f_Binary_to_Gray(bin_c);


   -- architecture body
end architecture_Gray_Code_Adder;
