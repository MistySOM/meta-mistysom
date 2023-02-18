SUMMARY = "GStreamer DRP-AI plugin"
SECTION = "multimedia"
LICENSE = "MIT"
DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base drpai kernel-module-udmabuf"
inherit meson

SRC_URI = "git://github.com/MistySOM/gstreamer1.0-drpai.git;branch=main"
SRCREV = "348237f7782341701c3243e5f8b4c723cfd8cf1e"
LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=bba6cdb9c2b03c849ed4975ed9ed90dc"

S = "${WORKDIR}/git"
PV = "1.0"

FILES_${PN} = " \
    ${libdir}/gstreamer-1.0/libgstdrpai.so \
"

FILES_${PN}-dev = "${libdir}/gstreamer-1.0/libgstdrpai.la"
FILES_${PN}-staticdev = "${libdir}/gstreamer-1.0/libgstdrpai.a"
FILES_${PN}-dbg = " \
    ${libdir}/gstreamer-1.0/.debug \
    ${prefix}/src"
