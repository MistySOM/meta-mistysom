SUMMARY = "DisplayLink and EVDI kernel driver"
DESCRIPTION = "DisplayLink and EVDI kernel driver"
LICENSE = "CLOSED"

SRC_URI = "https://www.synaptics.com/sites/default/files/exe_files/2022-08/DisplayLink%20USB%20Graphics%20Software%20for%20Ubuntu5.6.1-EXE.zip;downloadfilename=displaylink.zip"
SRC_URI[sha256sum] = "89279748a9e276073ddfff7e949f2b92e30dc19f29a34c40ffcd3356c6d730c2"

PROVIDES = "evdi displaylink"

S = "${WORKDIR}/evdi"

PV = "5.6.1"

DEPENDS = "virtual/kernel kernel-devsrc linux-libc-headers libdrm"

inherit module kernel-module-split

EXTRA_OEMAKE  = "ARCH=${ARCH} \
                 KVER=${KERNEL_VERSION} \
                 KDIR=${STAGING_KERNEL_BUILDDIR}"
CFLAGS += " -w"

do_unpack () {
     unzip -o ${DL_DIR}/displaylink.zip -d ${WORKDIR}
     cd ${WORKDIR}
     ./displaylink-driver-5.6.1-59.184.run --nodiskspace --noexec --keep
     tar -xvf displaylink-driver-5.6.1-59.184/evdi.tar.gz -C evdi
}

do_compile () {
    oe_runmake
}

do_install () {
    install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
    install -m 755 ${B}/module/evdi.ko ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/evdi.ko

    install -d ${D}${libdir}
    install ${B}/../displaylink-driver-5.6.1-59.184/aarch64-linux-gnu/libusb-1.0.so.0.2.0 ${D}${libdir}

    install -d ${D}${bindir}
    install ${B}/../displaylink-driver-5.6.1-59.184/aarch64-linux-gnu/DisplayLinkManager ${D}${bindir}

    install -d ${D}${nonarch_base_libdir}/systemd/system
    cat > ${D}${nonarch_base_libdir}/systemd/system/displaylink-driver.service <<EOF
[Unit]
Description=DisplayLink Driver Service
After=display-manager.service
Conflicts=getty@tty7.service

[Service]
ExecStartPre=/bin/sh -c 'modprobe evdi || (dkms install \$(ls -t /usr/src | grep evdi | head -n1  | sed -e "s:-:/:") && modprobe evdi)'
ExecStart=/opt/displaylink/DisplayLinkManager
Restart=always
WorkingDirectory=/opt/displaylink
RestartSec=5

EOF
    chmod 644 ${D}${nonarch_base_libdir}/systemd/system/displaylink-driver.service
}

FILES_${PN} += "${bindir} ${libdir} ${nonarch_base_libdir}"
RPROVIDES_${PN} += "kernel-module-${PN}-${KERNEL_VERSION}"
INSANE_SKIP_${PN} += "already-stripped"
