petalinux-create --name startup       --enable --type apps --template install
petalinux-create --name axis-fifo     --enable --type modules
petalinux-create --name fifo-test     --enable --type apps --template c
petalinux-create --name wpa-supp-conf --enable --type apps --template install