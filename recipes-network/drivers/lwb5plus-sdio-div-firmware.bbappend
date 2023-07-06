 
do_install_append() {
    cd ${D}${nonarch_base_libdir}/firmware/brcm
    ln -s brcmfmac4373-sdio.txt      brcmfmac4373-sdio.renesas,smarc-evk.txt
    ln -s brcmfmac4373-sdio.bin      brcmfmac4373-sdio.renesas,smarc-evk.bin
    ln -s brcmfmac4373-sdio.clm_blob brcmfmac4373-sdio.renesas,smarc-evk.clm_blob
}
