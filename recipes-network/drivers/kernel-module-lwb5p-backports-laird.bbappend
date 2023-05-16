# BACKPORTS_CONFIG = "defconfig-wifi"

do_patch() {
    echo "CPTCFG_BRCM_TRACING=y" >> ${S}/defconfigs/lwb5p
    echo "CPTCFG_BRCMDBG=y"      >> ${S}/defconfigs/lwb5p
    echo "CPTCFG_CONSOLE_LOGLEVEL_DEFAULT=15" >> ${S}/defconfigs/lwb5p
    echo "CPTCFG_MESSAGE_LOGLEVEL_DEFAULT=7" >> ${S}/defconfigs/lwb5p

    echo "CPTCFG_BRCM_TRACING=y" >> ${S}/defconfigs/lwb5p_nbt
    echo "CPTCFG_BRCMDBG=y"      >> ${S}/defconfigs/lwb5p_nbt
    echo "CPTCFG_CONSOLE_LOGLEVEL_DEFAULT=15" >> ${S}/defconfigs/lwb5p_nbt
    echo "CPTCFG_MESSAGE_LOGLEVEL_DEFAULT=7" >> ${S}/defconfigs/lwb5p_nbt
}
