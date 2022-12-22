SUMMARY = "MistySOM image."

IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"

LICENSE = "MIT"

inherit core-image features_check
inherit extrausers

REQUIRED_DISTRO_FEATURES = "wayland"

##Set rootfs  to 200MiB by default
#IMAGE_OVERHEAD_FACTOR ?= "1.0"
#IMAGE_ROOTFS_SIZE ?= "294800"
#
## Change root password (note the capital -P)
#EXTRA_USERS_PARAMS = "\
#    usermod -P 'toor' root \
#    "

CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland matchbox-terminal', '', d)}"
