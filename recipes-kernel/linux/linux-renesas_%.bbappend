FILESEXTRAPATHS_prepend := "${THISDIR}:"
SRC_URI += "file://0001-add-vsc8531-userspace-dts.patch"

FILESEXTRAPATHS_prepend := "${THISDIR}/Kconfigs:"
SRC_URI += "file://WIRELESS.cfg"