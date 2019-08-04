#!/bin/sh

source ./env.sh

TMP=$(mktemp -d)
mkdir $TMP/root

cp $ALPINE_BUILD/boot/initramfs-vanilla $TMP

(cd $TMP/root && gunzip -c $TMP/initramfs-vanilla | cpio -i)

rm -r $TMP/root/lib/modules/*
rm -r $TMP/root/lib/firmware/*

cp -r $LINUX_BUILD/out/modules/lib/modules/* $TMP/root/lib/modules
mkdir -p $TMP/root/lib/firmware/ath9k_htc
cp -r ath9k_htc/htc_9271-1.4.0.fw $TMP/root/lib/firmware/ath9k_htc/

zipped_ramfs=$TMP/initramfs
(cd $TMP/root && find . | cpio -H newc -o | gzip -9 > $zipped_ramfs)
mkimage -n initramfs-sunxi -A arm -O linux -T ramdisk -C none -d $zipped_ramfs $DEST_DIR/initramfs-sunxi

cleanup() {
	echo "Remove $TMP"
	rm -rf $TMP
}

trap cleanup EXIT
