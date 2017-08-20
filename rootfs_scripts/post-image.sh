#!/bin/bash

# copy the files to the binaries_dir ("images")
cp -r $BR2_EXTERNAL_BUILDROOT_SUBMODULE_PATH/rootfs_scripts/files/* ${BINARIES_DIR}

# modify the raspberry genimage to include those files
tmp_genimage_cfg=$(mktemp)
patch board/raspberrypi/genimage-raspberrypi.cfg < $BR2_EXTERNAL_BUILDROOT_SUBMODULE_PATH/rootfs_scripts/genimage.cfg.diff -o $tmp_genimage_cfg

# run the post-image script with the modified genimage_cfg
source <( sed 's/GENIMAGE_CFG=.*/GENIMAGE_CFG=$tmp_genimage_cfg/' board/raspberrypi/post-image.sh )

