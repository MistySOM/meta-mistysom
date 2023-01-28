CORE_IMAGE_BASE_INSTALL += "gtk+3-demo clutter-1.0-examples"
CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'matchbox-terminal', '', d)}"
IMAGE_INSTALL_append = " python3"
IMAGE_INSTALL_append = " python3-datetime"
IMAGE_INSTALL_append = " python3-io"
IMAGE_INSTALL_append = " python3-core"
IMAGE_INSTALL_append = " python3-multiprocessing"
IMAGE_INSTALL_append = " usbutils"
IMAGE_INSTALL_append = " usbutils-python"
IMAGE_INSTALL_append = " phytool"
IMAGE_INSTALL_append = " ethtool"

# For Display
IMAGE_INSTALL_append = " xserver-xorg-xvfb"
WHITELIST_GPL-3.0 += "vte-locale-en-gb"

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
IMAGE_INSTALL_append = " mmngr-user-module"
IMAGE_INSTALL_append = " kernel-module-mmngr"
IMAGE_INSTALL_append = " kernel-module-mmngrbuf"
IMAGE_INSTALL_append = " vspmif-user-module"
IMAGE_INSTALL_append = " kernel-module-vspm"
IMAGE_INSTALL_append = " kernel-module-vspmif"

# For Wifi
IMAGE_INSTALL_append = " iw"
IMAGE_INSTALL_append = " dhcpcd"
IMAGE_INSTALL_append = " wpa-supplicant"
# WiFi Module Archer T2UH
IMAGE_INSTALL_append = " linux-firmware-mt7650"
IMAGE_INSTALL_append = " kernel-module-mt76x0u"
# WiFi Module Archer T2U Plus
IMAGE_INSTALL_append = " kernel-module-rtl8821au"

# For eMMC flashing
IMAGE_INSTALL_append = " e2fsprogs"
