
# Failed attempt to add other wifi modules with the command below
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
