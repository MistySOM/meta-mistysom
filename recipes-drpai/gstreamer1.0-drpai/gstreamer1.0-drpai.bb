SUMMARY = "GStreamer DRP-AI plugin"
SECTION = "multimedia"
LICENSE = "MIT"
SRC_URI = "git://github.com/MistySOM/gstreamer1.0-drpai.git;branch=main"
SRCREV = "b7cd0e7e0253f397c80bfb5b930369d90bb0491e"
LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=bba6cdb9c2b03c849ed4975ed9ed90dc"

inherit meson

DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base drpai"

S = "${WORKDIR}/git"
PV = "1.0"

FILES_${PN} = "${libdir}/gstreamer-1.0/libgstdrpai.so"
FILES_${PN}-dev = "${libdir}/gstreamer-1.0/libgstdrpai.la"
FILES_${PN}-staticdev = "${libdir}/gstreamer-1.0/libgstdrpai.a"
FILES_${PN}-dbg = " \
    ${libdir}/gstreamer-1.0/.debug \
    ${prefix}/src"

RDEPENDS_${PN} = "gstreamer1.0 gstreamer1.0-plugins-base kernel-module-udmabuf"