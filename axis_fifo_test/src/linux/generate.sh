petalinux-create -t apps --name startup --enable --template install
petalinux-create -t modules --name axis-fifo --enable
petalinux-create -t apps --name fifo-test --enable --template c