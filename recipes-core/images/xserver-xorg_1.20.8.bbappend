PACKAGECONFIG[glamor] = "--disable-glamor,--disable-glamor,libepoxy,libegl"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://Xvfb.service"
SYSTEMD_SERVICE_${PN}-xvfb = "Xvfb.service"
FILES_${PN}-xvfb += "${systemd_system_unitdir}/Xvfb.service"
