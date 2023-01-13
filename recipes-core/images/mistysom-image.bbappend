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

IMAGE_INSTALL_append = " xserver-xorg-xvfb"

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

IMAGE_INSTALL_append = " mt7610u"
IMAGE_INSTALL_append = " kernel-module-cfg80211"
IMAGE_INSTALL_append = " kernel-module-mac80211"

WHITELIST_GPL-3.0 += "vte-locale-en-gb"
