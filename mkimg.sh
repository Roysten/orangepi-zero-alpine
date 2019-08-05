#!/bin/sh

source ./env.sh

mkdir -p $SRC_DIR
mkdir -p $BUILD_DIR
mkdir -p $DEST_DIR

while getopts "c" opt; do
	case "$opt" in
		c)
			clean=1
			;;
	esac
done

./get_sources.sh
if [ "$clean" ] ; then
	./init_build.sh
fi

./build_uboot.sh
./build_linux.sh
./build_overlay.sh
./build_boot_script.sh
./build_initramfs.sh
./build_modloop.sh
