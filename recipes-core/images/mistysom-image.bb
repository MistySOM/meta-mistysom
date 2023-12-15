SUMMARY = "MistySOM image."

IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"

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

# 10GB rootfs size
IMAGE_ROOTFS_SIZE ?= "10485760"

#
## Change root password (note the capital -P)
#EXTRA_USERS_PARAMS = "\
#    usermod -P 'toor' root \
#    "

