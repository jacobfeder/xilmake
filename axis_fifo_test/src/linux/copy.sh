SOURCE_DIR=$1
LINUX_PROJECT_PATH=$2

# device tree modifications
cp -f -v $SOURCE_DIR"/system-user.dtsi" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-bsp/device-tree/files"

# recipe for overwriting existing files
# see https://forums.xilinx.com/t5/Embedded-Linux/SD-Card-Automount-with-fstab-petalinux/td-p/673174
mkdir -p $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-core/base-files/base-files"
cp -f -v $SOURCE_DIR"/base-files/base-files_3.0.14.bbappend" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-core/base-files"
# fstab file for mounting SD card boot partition
cp -f -v $SOURCE_DIR"/base-files/files/fstab" $LINUX_PROJECT_PATH"/project-spec/meta-user/recipes-core/base-files/base-files"

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