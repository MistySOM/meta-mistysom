
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

do_patch_append() {
    # Uncomment any patches here for which you wish to enable specific features for hardware testing
    dts_patches=(
        #${THISDIR}/dts/add-vsc8531-userspace.dts
        #${THISDIR}/dts/add-sx150x-port-expander.dts
        #${THISDIR}/dts/add-gpio-header-40-pin.dts
        #${THISDIR}/dts/add-RSPI0-port-to-40-pin-header.dts
        #${THISDIR}/dts/add-scif2-serial-port-for-uart-testing.dts
        #${THISDIR}/dts/add-riic1-i2c1-for-testing-i2c-on-hdr.dts
        #${THISDIR}/dts/add-can-ports.dts
    )

    if [[ "${#dts_patches[@]}" -gt 0 && "${dts_patches[*]}" != *"#"* ]]; then
        cat "${dts_patches[*]}" >> ${S}/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
        cat "${dts_patches[*]}" >> ${S}/arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
    fi
}

