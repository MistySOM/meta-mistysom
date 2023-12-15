FILES_${PN} += "/usr/lib"
do_install_append() {
    install -d ${D}/usr/lib
    cd ${D}/usr/lib
    lnr ${D}../lib64/rust/libaziot_keys.so libaziot_keys.so
}
