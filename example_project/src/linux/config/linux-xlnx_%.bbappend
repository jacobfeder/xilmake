
RDEPENDS_kernel-base = ""
KERNEL_IMAGETYPE_zynq ?= "zImage"
do_configure[depends] += "kern-tools-native:do_populate_sysroot"
SRC_URI_append = "file://plnx_kernel.cfg \
	file://wifi_stack.cfg \
	file://ralink5370.cfg \
	file://rtl8188cus.cfg \
	"
FILESEXTRAPATHS_prepend := "${THISDIR}/configs:"
do_deploy_append () {
	install -m 0644 ${D}/boot/System.map-${KERNEL_VERSION} ${DEPLOYDIR}/System.map.linux
}