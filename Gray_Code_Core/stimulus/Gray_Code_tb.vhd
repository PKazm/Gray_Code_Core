----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Wed Apr 29 20:20:39 2020
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: Gray_Code_tb.vhd
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture behavioral of testbench is

    constant SYSCLK_PERIOD : time := 10 ns; -- 100MHZ

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    constant N_BITS : natural := 4;

    type gray_table_type is array(0 to 2 ** N_BITS - 1) of std_logic_vector(N_BITS - 1 downto 0);
    constant gray_table : gray_table_type := (
        "0000", -- 0
        "0001", -- 1
        "0011", -- 2
        "0010", -- 3
        "0110", -- 4
        "0111", -- 5
        "0101", -- 6
        "0100", -- 7
        "1100", -- 8
        "1101", -- 9
        "1111", -- 10
        "1110", -- 11
        "1010", -- 12
        "1011", -- 13
        "1001", -- 14
        "1000"  -- 15
    );

    --=========================================================================
    -- Gray_Code_Counter
    --=========================================================================

    component Gray_Code_Counter
        generic (
            g_n_bits : natural
        );
        -- ports
        port( 
            -- Inputs
            CLK : in std_logic;
            RSTn : in std_logic;
            incr_cntr : in std_logic;

            -- Outputs
            gray_out : out std_logic_vector(g_n_bits - 1 downto 0)

            -- Inouts

        );
    end component;

    signal incr_cntr : std_logic;
    signal gray_out_cnt : std_logic_vector(N_BITS - 1 downto 0);


    --=========================================================================
    -- Gray_Code_Adder
    --=========================================================================

    component Gray_Code_Adder
        generic (
            g_n_bits : natural
        );
        port (
            gray_a : in std_logic_vector(g_n_bits - 1 downto 0);
            gray_b : in std_logic_vector(g_n_bits - 1 downto 0);
        
            gray_c : out std_logic_vector(g_n_bits - 1 downto 0)
        );
    end component;

    signal gray_a : std_logic_vector(N_BITS - 1 downto 0);
    signal gray_b : std_logic_vector(N_BITS - 1 downto 0);
    signal gray_c : std_logic_vector(N_BITS - 1 downto 0);

    --=========================================================================
    -- Binary_to_Gray
    --=========================================================================

    component Binary_to_Gray
        generic (
            g_n_bits : natural
        );
        port (
            bin_in : in std_logic_vector(g_n_bits - 1 downto 0);
            gray_out : out std_logic_vector(g_n_bits - 1 downto 0)
        );
    end component;

    signal bin_in_btg      : std_logic_vector(N_BITS - 1 downto 0);
    signal gray_out_btg    : std_logic_vector(N_BITS - 1 downto 0);

    --=========================================================================
    -- Gray_to_Binary
    --=========================================================================

    component Gray_to_Binary
        generic (
            g_n_bits : natural
        );
        port (
            gray_in : in std_logic_vector(g_n_bits - 1 downto 0);
            bin_out : out std_logic_vector(g_n_bits - 1 downto 0)
        );
    end component;

    signal gray_in_gtb     : std_logic_vector(N_BITS - 1 downto 0);
    signal bin_out_gtb     : std_logic_vector(N_BITS - 1 downto 0);

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  Gray_Code_Counter
    Gray_Code_Counter_0 : Gray_Code_Counter
        generic map(
            g_n_bits => N_BITS
        )
        -- port map
        port map( 
            -- Inputs
            CLK => SYSCLK,
            RSTn => NSYSRESET,
            incr_cntr => incr_cntr,

            -- Outputs
            gray_out => gray_out_cnt

            -- Inouts

        );

    Gray_Code_Adder_0 : Gray_Code_Adder
        generic map(
            g_n_bits => N_BITS
        )
        -- port map
        port map( 
            -- Inputs
            gray_a => gray_a,
            gray_b => gray_b,

            -- Outputs
            gray_c => gray_c

            -- Inouts

        );

    Binary_to_Gray_0 : Binary_to_Gray
        generic map(
            g_n_bits => N_BITS
        )
        -- port map
        port map( 
            -- Inputs
            bin_in => bin_in_btg,
            gray_out => gray_out_btg

            -- Outputs

            -- Inouts

        );

    Gray_to_Binary_0 : Gray_To_Binary
        generic map(
            g_n_bits => N_BITS
        )
        -- port map
        port map( 
            -- Inputs
            gray_in => gray_in_gtb,
            bin_out => bin_out_gtb

            -- Outputs

            -- Inouts

        );


    Gom_Jabbar : process
        variable temp_n : natural;
        variable error_yes : boolean;
    begin

        error_yes := FALSE;

        incr_cntr <= '0';
        gray_a <= (others => '0');
        gray_b <= (others => '0');
        bin_in_btg <= (others => '0');
        gray_in_gtb <= (others => '0');


        if(NSYSRESET /= '1') then
            wait until (NSYSRESET = '1');
        end if;

        --=========================================================================
        -- Test Binary to Gray Code
        --=========================================================================

        report "TEST BINARY TO GRAY CONVERTER STARTED";

        for i in 0 to 2**N_BITS - 1 loop

            temp_n := i mod 2**N_BITS;

            bin_in_btg <= std_logic_vector(to_unsigned(temp_n, bin_in_btg'length));

            wait for (SYSCLK_PERIOD * 1);

            assert (gray_out_btg = gray_table(i))
                report "Bin to Gray error at: " & integer'image(i) & "; expected: " & to_string(gray_out_btg) & ", got: " & to_string(gray_table(temp_n))
                severity error;

        end loop;

        report "TEST BINARY TO GRAY CONVERTER COMPLETE";

        --=========================================================================
        -- Test Gray to Binary Code
        --=========================================================================

        report "TEST GRAY TO BINARY CONVERTER STARTED";

        for i in 0 to 2**N_BITS - 1 loop

            temp_n := i mod 2**N_BITS;

            gray_in_gtb <= gray_table(temp_n);

            
            wait for (SYSCLK_PERIOD * 1);

            assert (bin_out_gtb = std_logic_vector(to_unsigned(temp_n, bin_out_gtb'length)))
                report "Gray to Bin error at: " & integer'image(i) & "; expected: " & to_hstring(to_unsigned(temp_n, bin_out_gtb'length)) & ", got: " & to_hstring(bin_out_gtb)
                severity error;

        end loop;

        report "TEST GRAY TO BINARY CONVERTER COMPLETE";

        --=========================================================================
        -- Test Gray Counter
        --=========================================================================

        report "TEST GRAY COUNTER STARTED";

        for i in 0 to 2**N_BITS - 1 loop

            temp_n := i mod 2**N_BITS;

            assert (gray_out_cnt = gray_table(temp_n))
                report "Gray Count error at: " & integer'image(i) & "; expected: " & to_string(gray_out_cnt) & " got: " & to_string(gray_table(temp_n))
                severity error;

            incr_cntr <= '1';

            wait for (SYSCLK_PERIOD * 1);

            incr_cntr <= '0';

            wait for (SYSCLK_PERIOD * 1);

        end loop;

        report "TEST GRAY COUNTER COMPLETE";

        --=========================================================================
        -- Test Gray Adder
        --=========================================================================

        report "TEST GRAY ADDER STARTED";

        for i in 0 to 2**N_BITS - 1 loop
            for k in 0 to 2**N_BITS - 1 loop
                gray_a <= gray_table(i);
                gray_b <= gray_table(k);

                wait for (SYSCLK_PERIOD * 1);

                temp_n := (i + k) mod 2**N_BITS;

                assert (gray_c = gray_table(temp_n))
                    report "Gray Adder error at: " & to_string(gray_a) & " + " & to_string(gray_b) & " = " & to_string(gray_c) & " expected: " & to_string(gray_table(temp_n))
                    severity error;
                    
                wait for (SYSCLK_PERIOD * 1);
            end loop;
        end loop;

        report "TEST GRAY ADDER COMPLETE";

        wait;
    end process;

end behavioral;

