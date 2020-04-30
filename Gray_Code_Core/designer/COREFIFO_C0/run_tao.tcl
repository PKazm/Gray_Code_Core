set_family {SmartFusion2}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_fwft.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_resetSync.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\Actel\DirectCore\COREFIFO\2.7.105\rtl\vhdl\core\fifo_pkg.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_sync_scntr.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_sync.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_NstagesSync.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_grayToBinConv.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\corefifo_async.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\COREFIFO_C0_COREFIFO_C0_0_LSRAM_top.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\COREFIFO_C0_COREFIFO_C0_0_ram_wrapper.vhd}
read_vhdl -mode vhdl_2008 -lib COREFIFO_LIB {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0_0\rtl\vhdl\core\COREFIFO.vhd}
read_vhdl -mode vhdl_2008 {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\component\work\COREFIFO_C0\COREFIFO_C0.vhd}
set_top_level {COREFIFO_C0}
map_netlist
check_constraints {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\constraint\synthesis_sdc_errors.log}
write_fdc {E:\Github_Repos\Gray_Code_Core\Gray_Code_Core\designer\COREFIFO_C0\synthesis.fdc}
