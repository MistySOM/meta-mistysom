SUMMARY = "WayVNC - A simple VNC server for Wayland"
LICENSE = "GPL-3.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=6b23380c9fa9c53c07960c39a76974f1"

SRC_URI = "git://github.com/any1/wayvnc.git;protocol=https"

SRCREV = "FETCH_HEAD"

S = "${WORKDIR}/git"

inherit meson pkgconfig

DEPENDS += " \
    wayland \
    wayland-protocols \
    libxkbcommon \
    pixman \
    glib-2.0 \
    gobject-introspection \
    cairo \
    libevdev \
    "

EXTRA_OEMESON = "-Denable_tests=false"

do_compile_prepend() {
    unset CFLAGS
    unset CXXFLAGS
    unset LDFLAGS
}

do_install_append() {
    oe_runmake 'DESTDIR=${D}' install
}

FILES_${PN} += "${datadir}/wayvnc"
