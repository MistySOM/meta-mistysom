FILESEXTRAPATHS_prepend := "${THISDIR}:"
SRC_URI += "file://0001-add-vsc8531-userspace-dts.patch"
SRC_URI += "file://0002-add-sx150x-port-expander-dts.patch"
SRC_URI += "file://0003-add-gpio-header-40-pin-dts.patch"
SRC_URI += "file://0004-add-RSPI0-port-to-40-pin-header.patch"
SRC_URI += "file://0005-add-scif2-serial-port-for-uart-testing.patch"
SRC_URI += "file://0006-add-riic1-i2c1-for-testing-i2c-on-hdr.patch"
SRC_URI += "file://0007-add-can-ports.patch"
