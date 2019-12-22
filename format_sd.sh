#!/bin/sh

lsblk
read -p "***WARNING***: Assuming /dev/sdc is the SD card. Is this correct? (y/N) " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]$ ]]
then
	exit 1
fi

DEV=/dev/sdc

sudo dd if=/dev/zero of=$DEV bs=1M count=1
sudo dd if=bin/u-boot-sunxi-with-spl.bin of=$DEV bs=1024 seek=8

sudo sfdisk $DEV < disk_layout.sfdisk
sudo mkfs.fat ${DEV}1
sudo mkfs.ext4 ${DEV}2
sudo mkfs.ext4 ${DEV}3
sync

TMPDIR=$(mktemp -d)
sudo mount ${DEV}1 $TMPDIR
sudo mkdir -p ${TMPDIR}/boot/dtbs
sudo cp bin/boot.scr ${TMPDIR}/boot
sudo cp bin/sun8i*.dtb* ${TMPDIR}/boot/dtbs
sudo cp bin/initramfs-sunxi ${TMPDIR}/boot
sudo cp bin/modloop ${TMPDIR}/boot
sudo cp bin/zImage ${TMPDIR}/boot/vmlinuz
sudo cp bin/uEnv.txt.disabled ${TMPDIR}/boot
sudo cp -r build/alpine/apks/ ${TMPDIR}/
sudo umount ${DEV}1
rmdir $TMPDIR

sync
