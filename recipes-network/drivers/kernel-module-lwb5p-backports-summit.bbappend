
inherit systemd

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://wl-reset.service"
SYSTEMD_SERVICE_${PN} += "wl-reset.service"
FILES_${PN} += "${systemd_system_unitdir}/wl-reset.service"

do_install_append() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${B}/../wl-reset.service ${D}${systemd_system_unitdir}
}

# Add compatibility with kernel 5.10.201 in VLP v3.0.6
do_configure_prepend() {
    if printf "%s\n%s" "5.10.188" "${KERNEL_VERSION}" | sort --version-sort --check=quiet; then
        echo "The etherdevice.h is already backported into the kernel ${KERNEL_VERSION}. So removing it from the module."
        rm ${S}/backport-include/linux/etherdevice.h
    else
        echo "Using the etherdevice.h on the module as it is not present in the kernel ${KERNEL_VERSION}."
    fi
}

# The line below is a failed attempt to add other wifi modules
# BACKPORTS_CONFIG = "defconfig-wifi"

# Uncomment the lines below for verbose kernel debug messages
# ===========================
# do_patch() {
#     echo "CPTCFG_BRCM_TRACING=y" >> ${S}/defconfigs/lwb5p
#     echo "CPTCFG_BRCMDBG=y"      >> ${S}/defconfigs/lwb5p
#     echo "CPTCFG_CONSOLE_LOGLEVEL_DEFAULT=15" >> ${S}/defconfigs/lwb5p
#     echo "CPTCFG_MESSAGE_LOGLEVEL_DEFAULT=7" >> ${S}/defconfigs/lwb5p
# }
# do_install_append() {
#     install -d  ${D}${sysconfdir}/modprobe.d
#     echo "options brcmfmac debug=0xffffff" > ${D}${sysconfdir}/modprobe.d/brcmfmac.conf
# }
# FILES_${PN} += "${sysconfdir}"
