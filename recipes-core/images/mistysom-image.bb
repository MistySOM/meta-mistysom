SUMMARY = "MistySOM image."

IMAGE_FEATURES += "splash package-management ssh-server-dropbear hwcodecs"

LICENSE = "MIT"

inherit core-image features_check
inherit extrausers

REQUIRED_DISTRO_FEATURES = "wayland"

# What extensions would the image generate in the output directory
IMAGE_FSTYPES = "wic.bz2 ext4.bz2"

# Set what to include in /boot partition of wic.bz2
IMAGE_BOOT_FILES = "Image-*.bin r9*.dtb"

# Add device tree files in /boot directory of ext4.bz2
do_copy_dtb() {
  mkdir -p ${IMAGE_ROOTFS}/boot/
  cp ${DEPLOY_DIR_IMAGE}/r9*.dtb ${IMAGE_ROOTFS}/boot/
}
addtask do_copy_dtb before do_rootfs
IMAGE_PREPROCESS_COMMAND += "do_copy_dtb;"

##Set rootfs  to 200MiB by default
#IMAGE_OVERHEAD_FACTOR ?= "1.0"
#IMAGE_ROOTFS_SIZE ?= "294800"
#
## Change root password (note the capital -P)
#EXTRA_USERS_PARAMS = "\
#    usermod -P 'toor' root \
#    "

