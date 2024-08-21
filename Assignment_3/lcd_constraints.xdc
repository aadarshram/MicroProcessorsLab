set_property -dict { PACKAGE_PIN P3 IOSTANDARD LVCMOS33 } [get_ports {data[7]}];
4
# fill in six more lines - identify the appropriate package pins
# fill in the package pins for Enable, RS and input clk
set_property -dict { PACKAGE_PIN .... IOSTANDARD LVCMOS33 } [get_ports {lcd_e}];
set_property -dict { PACKAGE_PIN .... IOSTANDARD LVCMOS33 } [get_ports {lcd_rs}];
set_property -dict { PACKAGE_PIN .... IOSTANDARD LVCMOS33 } [get_ports { in_Clk }];