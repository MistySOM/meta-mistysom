SUMMARY = "MistySOM image."
ROOTPASSWD = "toor"
USERNAME = "steve"
USERPASSWD = "3a5+lSAv3"

IMAGE_FEATURES += "splash package-management ssh-server-openssh hwcodecs"

LICENSE = "MIT"

inherit core-image features_check
inherit extrausers

REQUIRED_DISTRO_FEATURES = "wayland"

# What extensions would the image generate in the output directory
IMAGE_FSTYPES = "wic.bz2"

# Set what to include in boot partition of wic.bz2
IMAGE_BOOT_FILES = "Image* r9*.dtb"

# Add device tree files in /boot directory of rootfs
do_copy_dtb() {
  mkdir -p ${IMAGE_ROOTFS}/boot/
  cp ${DEPLOY_DIR_IMAGE}/r9*.dtb ${IMAGE_ROOTFS}/boot/
}
IMAGE_PREPROCESS_COMMAND += "do_copy_dtb;"

##Set rootfs  to 200MiB by default
#IMAGE_OVERHEAD_FACTOR ?= "1.0"
#IMAGE_ROOTFS_SIZE ?= "294800"

EXTRA_USERS_PARAMS = "\
    usermod -P '${ROOTPASSWD}' root; \
    useradd '${USERNAME}'; \
    usermod -P '${USERPASSWD}' '${USERNAME}'; \
    "

