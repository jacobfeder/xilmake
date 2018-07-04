#
# This file is the driver-firmware recipe.
#

SUMMARY = "install external firmware blobs"
SECTION = "PETALINUX/apps"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://rt2870.bin \
	   file://rtl8192cufw.bin \
	   file://rtl8192cufw_TMSC.bin \
	"

S = "${WORKDIR}"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_install() {
	install -d ${D}/${base_libdir}/firmware/
	install -d ${D}/${base_libdir}/firmware/rtlwifi
	install -m 0755 ${S}/rt2870.bin ${D}/${base_libdir}/firmware/
	install -m 0755 ${S}/rtl8192cufw.bin ${D}/${base_libdir}/firmware/rtlwifi
	install -m 0755 ${S}/rtl8192cufw_TMSC.bin ${D}/${base_libdir}/firmware/rtlwifi
}

FILES_${PN} += "${sysconfdir}/*"