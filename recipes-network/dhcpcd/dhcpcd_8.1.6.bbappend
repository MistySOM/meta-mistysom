inherit systemd

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://dhcpcd.service \
            file://dhcpcd@.service"
SYSTEMD_SERVICE_${PN} += "dhcpcd.service \
                          dhcpcd@.service"
FILES_${PN} += "${systemd_system_unitdir}/dhcpcd.service \
                ${systemd_system_unitdir}/dhcpcd@.service"

do_install_append() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${B}/../dhcpcd*.service ${D}${systemd_system_unitdir}
}
