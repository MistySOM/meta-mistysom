FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://dhcpcd.service \
            file://dhcpcd@.service"
SYSTEMD_SERVICE_${PN} = "dhcpcd.service"
FILES_${PN} += "${systemd_system_unitdir}/dhcpcd.service"
