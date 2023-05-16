 
do_install_append() {
    install -d  ${D}${sysconfdir}/modprobe.d
    echo "options brcmfmac regdomain=\"US\" debug=0xffffff" > ${D}${sysconfdir}/modprobe.d/brcmfmac.conf

    cd ${D}${nonarch_base_libdir}/firmware/brcm
    ln -s brcmfmac4373-sdio.txt      brcmfmac4373-sdio.renesas,smarc-evk.txt
    ln -s brcmfmac4373-sdio.bin      brcmfmac4373-sdio.renesas,smarc-evk.bin
    ln -s brcmfmac4373-sdio.clm_blob brcmfmac4373-sdio.renesas,smarc-evk.clm_blob
}

FILES_${PN} += "${sysconfdir}"
