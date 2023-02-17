SUMMARY = "Firmware files for use with Linux kernel"
HOMEPAGE = "https://www.kernel.org/"
DESCRIPTION = "Linux firmware is a package distributed alongside the Linux kernel \
that contains firmware binary blobs necessary for partial or full functionality \
of certain hardware devices."
SECTION = "kernel"

LICENSE = "Firmware-ralink_a_mediatek_company_firmware \
           & WHENCE\
"
LIC_FILES_CHKSUM = "file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
                    file://WHENCE;md5=79f477f9d53eedee5a65b45193785963 \
"

# These are not common licenses, set NO_GENERIC_LICENSE for them
# so that the license files will be copied from fetched source
NO_GENERIC_LICENSE[Firmware-ralink_a_mediatek_company_firmware] = "LICENCE.ralink_a_mediatek_company_firmware"
NO_GENERIC_LICENSE[WHENCE] = "WHENCE"

PE = "1"
PV = "20211216"
S = "${WORKDIR}/linux-firmware-20211216"

SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/linux-firmware-${PV}.tar.xz"

SRC_URI[sha256sum] = "eeddb4e6bef31fd1a3757f12ccc324929bbad97855c0b9ec5ed780f74de1837d"

inherit allarch

CLEANBROKEN = "1"

do_compile() {
        :
}

do_install() {
        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware-tmp' install
        cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware-tmp/
        
        mkdir ${D}${nonarch_base_libdir}/firmware
        mv ${D}${nonarch_base_libdir}/firmware-tmp/mt7650.bin ${D}${nonarch_base_libdir}/firmware/
        mv ${D}${nonarch_base_libdir}/firmware-tmp/LICENCE.ralink_a_mediatek_company_firmware ${D}${nonarch_base_libdir}/firmware/
        rm -rf ${D}${nonarch_base_libdir}/firmware-tmp
}

FILES_${PN} = "${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmware \
               ${nonarch_base_libdir}/firmware/mt7650.bin"

# Firmware files are generally not ran on the CPU, so they can be
# allarch despite being architecture specific
INSANE_SKIP = "arch"
