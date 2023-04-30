DESCRIPTION = "PacketSender"
SECTION = "net"
LICENSE = "CLOSED"
PV = "8.3.5"

SRC_URI = "https://github.com/dannagle/packetsender.git;protocol=git;tag=v${PV}"

S = "${WORKDIR}/git"

do_compile() {
    oe_runmake
}

do_install() {
    oe_runmake install DESTDIR=${D}
}
