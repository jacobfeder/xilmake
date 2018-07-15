petalinux-create --name startup         --enable --type apps --template install
petalinux-create --name driver-firmware --enable --type apps --template install
petalinux-create --name wpa-supp        --enable --type apps --template install
petalinux-create --name axis-fifo       --enable --type modules
petalinux-create --name fifo-test       --enable --type apps --template c