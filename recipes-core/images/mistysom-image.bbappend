CORE_IMAGE_BASE_INSTALL += "pv htop kernel-modules weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
IMAGE_INSTALL_append = " python3"
IMAGE_INSTALL_append = " python3-datetime"
IMAGE_INSTALL_append = " python3-io"
IMAGE_INSTALL_append = " python3-core"
IMAGE_INSTALL_append = " python3-multiprocessing"
IMAGE_INSTALL_append = " usbutils"
IMAGE_INSTALL_append = " usbutils-python"
IMAGE_INSTALL_append = " can-utils"
IMAGE_INSTALL_append = " libsocketcan"
IMAGE_INSTALL_append = " iproute2"
IMAGE_INSTALL_append = " sudo"
IMAGE_INSTALL_append = " tzdata"

# For Camera
IMAGE_INSTALL_append = " i2c-tools"
PACKAGECONFIG_append_pn-libgpiod = " python3"
IMAGE_INSTALL_append = " libgpiod libgpiod-tools"
IMAGE_INSTALL_append = " v4l-utils"
IMAGE_INSTALL_append = " v4l-utils-dev"
IMAGE_INSTALL_append = " v4l2-init"
IMAGE_INSTALL_append = " v4l2-init-dev"
IMAGE_INSTALL_append = " libv4l"
IMAGE_INSTALL_append = " libv4l-dev"
IMAGE_INSTALL_append = " yavta"
IMAGE_INSTALL_append = " yavta-dev"
IMAGE_INSTALL_append = " gstreamer1.0"
IMAGE_INSTALL_append = " gstreamer1.0-dev"
IMAGE_INSTALL_append = " gst-examples"
IMAGE_INSTALL_append = " gstreamer1.0-plugins-base"
IMAGE_INSTALL_append = " gstreamer1.0-plugins-good"
IMAGE_INSTALL_append = " gstreamer1.0-plugins-bad"
IMAGE_INSTALL_append = " gstreamer1.0-plugins-ugly"
IMAGE_INSTALL_append = " gstreamer1.0-rtsp-server"

# For Hardware Acceleration and Video Codecs
IMAGE_INSTALL_append = " gstreamer1.0-plugin-vspmfilter"
IMAGE_INSTALL_append = " gstreamer1.0-omx"
IMAGE_INSTALL_append = " omx-user-module"
IMAGE_INSTALL_append = " mmngrbuf-user-module kernel-module-mmngrbuf"
IMAGE_INSTALL_append = " mmngr-user-module kernel-module-mmngr"
IMAGE_INSTALL_append = " vspmif-user-module kernel-module-vspm kernel-module-vspmif"

# For Wifi
IMAGE_INSTALL_append = " iw"
IMAGE_INSTALL_append = " dhcpcd"
IMAGE_INSTALL_append = " wpa-supplicant"

# WiFi Module Laird Sterling-LWB5+ (Disable other WiFi modules because this module compiles a different cfg80211.ko)
#IMAGE_INSTALL_append = " lwb5plus-sdio-div-firmware"
#IMAGE_INSTALL_append = " kernel-module-lwb5p-backports-laird"
#IMAGE_FEATURES_remove = "tools-profile tools-debug tools-testapps"
# WiFi Module Archer T2UH
IMAGE_INSTALL_append = " linux-firmware-mt7650"
IMAGE_INSTALL_append = " kernel-module-mt76x0u"
# WiFi Module Archer T2U Plus
IMAGE_INSTALL_append = " kernel-module-rtl8821au"

# For eMMC flashing
IMAGE_INSTALL_append = " e2fsprogs"
IMAGE_INSTALL_append = " e2fsprogs-resize2fs"

# For PHY bringup
IMAGE_INSTALL_append = " phytool"
IMAGE_INSTALL_append = " ethtool"
IMAGE_INSTALL_append = " mdio-tools"
IMAGE_INSTALL_append = " net-tools"
IMAGE_INSTALL_append = " tcpdump"
IMAGE_INSTALL_append = " iputils"
IMAGE_INSTALL_append = " tmux"

# For Docker
IMAGE_INSTALL_append = " docker-ce"

# For NodeJS and NPM
IMAGE_INSTALL_append = " nodejs"
IMAGE_INSTALL_append = " nodejs-npm"

# Debug
IMAGE_INSTALL_append = " gdb gdbserver"
IMAGE_INSTALL_append = " rsync openssh-sftp-server"
IMAGE_INSTALL_append = " gcc"
IMAGE_INSTALL_append = " meson ninja cmake make"
