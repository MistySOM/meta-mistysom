PACKAGECONFIG[glamor] = "--disable-glamor,--disable-glamor,libepoxy,libegl"

do_install_append () {
    install -d ${D}${systemd_system_unitdir}
    cat > ${D}${systemd_system_unitdir}/Xvfb.service <<EOF
[Unit]
Description=X virtual framebuffer Service

[Service]
User=root
ExecStart=/usr/bin/Xvfb :1 -screen 0 1024x768x24

[Install]
WantedBy=multi-user.target
Alias=xvfb.service
Alias=xvfbd.service
EOF
    chmod 755 ${D}${systemd_system_unitdir}/Xvfb.service
}
SYSTEMD_SERVICE_${PN}-xvfb = "Xvfb.service"
