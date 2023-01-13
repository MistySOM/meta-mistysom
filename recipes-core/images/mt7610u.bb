SUMMARY = "mt7610u wifi kernel driver"
DESCRIPTION = "mt7610u wifi kernel driver"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=a4af7fbaf6db352a85fd67d8980b0f09"

SRC_URI = "git://https://github.com/Myria-de/mt7610u_wifi_sta_v3002_dpo_20130916;branch=master"
SRCREV = "16911dec596d54a1ff2efaaa2ae13442b65e8045"

PROVIDES = "mt7610u"

S = "${WORKDIR}/git"

PV = "v3002"

DEPENDS = "virtual/kernel bc-native wpa-supplicant"

inherit module

EXTRA_OEMAKE += "ARCH=${ARCH}"
EXTRA_OEMAKE += " LINUX_SRC=${STAGING_KERNEL_BUILDDIR}"
EXTRA_OEMAKE += " -I${S}/usr/bin' "
#CFLAGS += " -w"

#RPROVIDES_${PN} += "kernel-module-${PN}-${KERNEL_VERSION}"

do_install () {
    install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
    install -m 0755 ${B}/os/linux/*.ko ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
}

