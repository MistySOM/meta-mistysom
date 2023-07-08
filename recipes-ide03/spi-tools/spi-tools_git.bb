SUMMARY = "SPI Tools"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = "file://LICENSE;md5=e8f96a917ac05ba52db5fabd665df1700f5b9b46"
SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=https"

SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

inherit autotools

EXTRA_OECONF = ""

do_configure_prepend() {
    # Optional: Perform any pre-configuration steps here
}

do_compile() {
    oe_runmake
}

do_install() {
    oe_runmake install DESTDIR=${D}
}

FILES_${PN} += "${bindir}/spi-tools ${bindir}/spidev_test"


