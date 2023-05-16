
FILESEXTRAPATHS_prepend := "${THISDIR}/Kconfigs:"
SRC_URI += "file://CANBUS.cfg"
SRC_URI += "file://FB_UDL.cfg"
SRC_URI += "file://GPIO.cfg"
SRC_URI += "file://GT9271.cfg"
SRC_URI += "file://RTL8152.cfg"
SRC_URI += "file://SX150.cfg"
SRC_URI += "file://TLV320AIC23.cfg"
SRC_URI += "file://USB_GADGET.cfg"
SRC_URI += "file://VSC8531.cfg"
SRC_URI += "file://WIRELESS.cfg"

FILESEXTRAPATHS_prepend := "${THISDIR}/dts:"
SRC_URI += "file://0001-remove-sdhi1-uhs.patch"
SRC_URI += "file://0002-add-sdhi1-laird.patch"

# Uncomment any patches here for which you wish to enable specific features for hardware testing
#SRC_URI += "file://add-vsc8531-userspace.dts"
#SRC_URI += "file://add-sx150x-port-expander.dts"
#SRC_URI += "file://add-gpio-header-40-pin.dts"
#SRC_URI += "file://add-RSPI0-port-to-40-pin-header.dts"
#SRC_URI += "file://add-scif2-serial-port-for-uart-testing.dts"
#SRC_URI += "file://add-riic1-i2c1-for-testing-i2c-on-hdr.dts"
#SRC_URI += "file://add-can-ports.dts"

do_patch_append() {
    cat ${WORKDIR}/*.dts >> ${S}/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts || :
    cat ${WORKDIR}/*.dts >> ${S}/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts || :
}

