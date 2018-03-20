#!/bin/bash

cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"

# HyperPixel LCD Settings
dtoverlay=hyperpixel
overscan_left=0
overscan_right=0
overscan_top=0
overscan_bottom=0
framebuffer_width=800
framebuffer_height=480
enable_dpi_lcd=1
display_default_lcd=1
dpi_group=2
dpi_mode=87
dpi_output_format=0x6f016
display_rotate=2
hdmi_timings=800 0 50 20 50 480 1 3 2 3 0 0 0 60 0 32000000 6

# Use a basic GPIO backlight driver with on/off support
dtoverlay=hyperpixel-gpio-backlight
__EOF__

# copy the files to the binaries_dir ("images")
cp -r $BR2_EXTERNAL_BUILDROOT_SUBMODULE_PATH/rootfs_scripts/files/* ${BINARIES_DIR}

# modify the raspberry genimage to include those files
tmp_genimage_cfg=$(mktemp)
patch board/raspberrypi/genimage-raspberrypi.cfg < $BR2_EXTERNAL_BUILDROOT_SUBMODULE_PATH/rootfs_scripts/genimage.cfg.diff -o $tmp_genimage_cfg

# run the post-image script with the modified genimage_cfg
source <( sed 's/GENIMAGE_CFG=.*/GENIMAGE_CFG=$tmp_genimage_cfg/' board/raspberrypi/post-image.sh )

