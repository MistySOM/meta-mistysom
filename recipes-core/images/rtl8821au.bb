SUMMARY = "RTL8821AU kernel driver (wifi)"
DESCRIPTION = "RTL8821AU kernel driver"
LICENSE = "GPL-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=9925fbb78837e87efa0522d118989766"

SRCREV = "641438d40bf2e1742a88bcc887fc49f6f33c021c"
SRC_URI = "git://github.com/morrownr/8821au-20210708;protocol=https;branch=main"

S = "${WORKDIR}/git"

PV = "5.12.5.2"

DEPENDS = "virtual/kernel bc-native"

inherit module

EXTRA_OEMAKE  = "ARCH=${ARCH}"
EXTRA_OEMAKE += "KSRC=${STAGING_KERNEL_BUILDDIR}"

MODULES_INSTALL_TARGET="install"

do_install () {
    install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net/wireless
    install -m 0644 ${B}/8821au.ko ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net/wireless/rtl8821au.ko
}

FILES:${PN} += "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/drivers/net/wireless/rtl8821au.ko"
RPROVIDES:${PN} += "kernel-module-rtl8821au-${KERNEL_VERSION}"