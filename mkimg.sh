#!/bin/sh

source ./env.sh

mkdir $SRC_DIR
mkdir $BUILD_DIR
mkdir $DEST_DIR

./get_sources.sh
./init_build.sh
./build_uboot.sh
./build_linux.sh
./dt_overlay/build_overlay.sh
./boot_script/build.sh
