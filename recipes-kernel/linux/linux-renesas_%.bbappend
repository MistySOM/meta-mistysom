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
SRC_URI += "file://0001-remove-sdhi1-uhs.dts"
SRC_URI += "file://0002-add-sdhi1-laird.dts"
SRC_URI += "file://add-vsc8531-ethernet.dts"
SRC_URI += "file://add-can-ports.dts"
SRC_URI += "file://0003-add-mcu-intefaces.patch"

# Uncomment any patches here for which you wish to enable specific features for hardware testing
#SRC_URI += "file://add-sx150x-port-expander.dts"
#SRC_URI += "file://add-gpio-header-40-pin.dts"
#SRC_URI += "file://add-RSPI0-port-to-40-pin-header.dts"
#SRC_URI += "file://add-scif2-serial-port-for-uart-testing.dts"
#SRC_URI += "file://add-riic1-i2c1-for-testing-i2c-on-hdr.dts"

# The ${KERNEL_DEVICETREE} variable contains '   renesas/r9a07g044l2-smarc.dtb    ';
# So the extra whitespaces needs to removed with strip() function,
# We can extract the file name and remove the directory name with rsplit('/', 1)[-1] function,
# And lastly, we can remove the extension with rsplit('.',1)[0] function resulting in 'r9a07g044l2-smarc'
DT = "${@d.getVar('KERNEL_DEVICETREE', True).strip().rsplit('/', 1)[-1].rsplit('.', 1)[0]}"

# Using this ${DT} variable we can backup and patch the correct devicetree.
do_patch_append() {
    cp ${S}/arch/arm64/boot/dts/renesas/${DT}.dts ${WORKDIR}/${DT}.dts.orig
    cat ${WORKDIR}/*.dts >> ${S}/arch/arm64/boot/dts/renesas/${DT}.dts || :
}

# Restore backup, allowing to have multiple 'bitbake mistysom-image' executions.
do_deploy_append() {
    cp ${WORKDIR}/${DT}.dts.orig ${S}/arch/arm64/boot/dts/renesas/${DT}.dts
}
