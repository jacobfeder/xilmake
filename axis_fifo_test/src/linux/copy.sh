SOURCE_DIR=$1
LINUX_PROJECT_PATH=$2

# device tree modifications
cp -f -v $SOURCE_DIR"/system-user.dtsi" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-bsp/device-tree/files"

# overwrite /etc/fstab
# see https://forums.xilinx.com/t5/Embedded-Linux/SD-Card-Automount-with-fstab-petalinux/td-p/673174
mkdir -p $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-core/base-files/files"
cp -f -v $SOURCE_DIR"/base-files/base-files_%.bbappend" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-core/base-files"
cp -f -v $SOURCE_DIR"/base-files/files/fstab" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-core/base-files/files"

# overwrite /etc/network/interfaces
# see https://www.xilinx.com/support/answers/69119.html
mkdir -p $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-core/init-ifupdown/files"
cp -f -v $SOURCE_DIR"/init-ifupdown/init-ifupdown_1.0.bbappend" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-core/init-ifupdown"
cp -f -v $SOURCE_DIR"/init-ifupdown/files/interfaces" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-core/init-ifupdown/files"

# startup script
cp -f -v $SOURCE_DIR"/startup/startup.bb" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-apps/startup"
cp -f -v $SOURCE_DIR"/startup/startup" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-apps/startup/files"

# driver firmware blob installation
cp -f -v $SOURCE_DIR"/driver-firmware/driver-firmware.bb" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-apps/driver-firmware"
cp -f -v $SOURCE_DIR"/driver-firmware/files/"* $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-apps/driver-firmware/files"

# configuration file for wifi
cp -f -v $SOURCE_DIR"/wpa-supp/wpa-supp.bb" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-apps/wpa-supp"
cp -f -v $SOURCE_DIR"/wpa-supp/files/wpa_supplicant_custom.conf" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-apps/wpa-supp/files"

# axis-fifo driver
cp -f -v $SOURCE_DIR"/axis-fifo/axis-fifo.c" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-modules/axis-fifo/files"

# fifo test program
cp -f -v $SOURCE_DIR"/fifo-test/fifo-test.c" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-apps/fifo-test/files"