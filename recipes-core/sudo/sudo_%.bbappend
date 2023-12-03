FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://sudoers"

do_install_append() {
    install -m 0440 ${WORKDIR}/sudoers ${D}${sysconfdir}/sudoers
}
