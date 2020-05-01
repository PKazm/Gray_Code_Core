quietly set ACTELLIBNAME SmartFusion2
quietly set PROJECT_DIR "E:/Github_Repos/Gray_Code_Core/Gray_Code_Core"

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   file delete -force presynth 
   vlib presynth
}
vmap presynth presynth
vmap SmartFusion2 "C:/Microsemi/Libero_SoC_v12.4/Designer/lib/modelsimpro/precompiled/vlog/SmartFusion2"

vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Gray_Code_package.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/hdl/Gray_Code_Counter.vhd"
vcom -2008 -explicit  -work presynth "${PROJECT_DIR}/stimulus/Gray_Code_tb.vhd"

vsim -L SmartFusion2 -L presynth  -t 10ps presynth.testbench
add wave /testbench/*
run 100us
