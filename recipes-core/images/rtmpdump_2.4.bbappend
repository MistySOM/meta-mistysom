FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://rtmpsrv.service"
SYSTEMD_SERVICE_${PN} += "rtmpsrv.service"
FILES_${PN} += "${systemd_system_unitdir}/rtmpsrv.service"

do_install_append() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${B}/../rtmpsrv.service ${D}${systemd_system_unitdir}
}
