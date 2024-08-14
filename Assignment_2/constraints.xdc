# Design constraint file for the three-bit Johnson Counter
# Clock signal
set_property -dict { PACKAGE_PIN N11 IOSTANDARD LVCMOS33 } [get_ports { in_clk }];

# Sliding switch -- to start count
set_property -dict { PACKAGE_PIN L5 IOSTANDARD LVCMOS33 } [get_ports { rst }];

#Enable seven segment display
set_property -dict { PACKAGE_PIN F2 IOSTANDARD LVCMOS33 } [get_ports {digit[0]}];
set_property -dict { PACKAGE_PIN E1 IOSTANDARD LVCMOS33 } [get_ports {digit[1]}];
set_property -dict { PACKAGE_PIN G5 IOSTANDARD LVCMOS33 } [get_ports {digit[2]}];
set_property -dict { PACKAGE_PIN G4 IOSTANDARD LVCMOS33 } [get_ports {digit[3]}];

#locations of the segments on the display
set_property -dict { PACKAGE_PIN G2 IOSTANDARD LVCMOS33 } [get_ports {Seven_Seg[0]}];
set_property -dict { PACKAGE_PIN G1 IOSTANDARD LVCMOS33 } [get_ports {Seven_Seg[1]}];
set_property -dict { PACKAGE_PIN H5 IOSTANDARD LVCMOS33 } [get_ports {Seven_Seg[2]}];
set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS33 } [get_ports {Seven_Seg[3]}];
set_property -dict { PACKAGE_PIN J5 IOSTANDARD LVCMOS33 } [get_ports {Seven_Seg[4]}];
set_property -dict { PACKAGE_PIN J4 IOSTANDARD LVCMOS33 } [get_ports {Seven_Seg[5]}];
set_property -dict { PACKAGE_PIN H2 IOSTANDARD LVCMOS33 } [get_ports {Seven_Seg[6]}];
set_property -dict { PACKAGE_PIN H1 IOSTANDARD LVCMOS33 } [get_ports {Seven_Seg[7]}];