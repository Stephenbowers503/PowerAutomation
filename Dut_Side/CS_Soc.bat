cd C:\Users\Local_Admin\Documents\TransferToSUT\socwatch_windows_NDA_v2021.1\64\
cmd /c .\socwatch.exe -f timer-resolution -f acpi-sstate -f igfx-throt-rsn -f ring-throt-rsn -f pch-slps0 -f hw-cpu-hwp -f cpu-gpu-concurrency -f ia-throt-rsn -f acpi-dstate -f gfx -f hw-igfx-pstate -f core-temp -f hw-cpu-cstate -f hw-igfx-cstate -f cpu-pkgc-cfg -f display-state -f sa-freq -f cpu-pkgc-dbg -f ddr-bw -f xhci-lpm -f xhci -f panel-srr -f sata-lpm -f pcie-lpm -f pcie-ltr -f pcie -f pch-slps0-dbg -f pkg-pwr -f os-cpu-pstate -f os-cpu-cstate -f hw-cpu-cstate -f pch-all -f platform-ltr -f lpss-ltr -f pch-ip-status -f hw-cpu-pstate-per-thread -f pch-ivr-state -f pch-ip-active-all -f tcss --option pch-count-always -t 600 -z -o C:\Users\Local_Admin\Documents\socwatch\CS\CS


Echo "Uninstalling WDTF Library"
msiexec.exe /x "C:\Users\Local_Admin\Documents\TransferToSUT\Autofiles\Dut_Side\OS_SETUP\WDTF\Windows Driver Testing Framework (WDTF) Runtime Libraries-x64_en-us.msi" /quiet
