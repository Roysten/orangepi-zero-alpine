#!/bin/sh

source ./env.sh

cd $UBOOT_BUILD
export PATH=$PATH:/$TOOLCHAIN

export CROSS_COMPILE=arm-linux-gnueabihf-
make orangepi_zero_defconfig

sed -i "s/CONFIG_BOOTDELAY=2/CONFIG_BOOTDELAY=1/g" .config
sed -i "s/CONFIG_USB_EHCI_HCD=y/# CONFIG_USB_EHCI_HCD is not set/g" .config
sed -i "s/CONFIG_USB_OHCI_HCD=y/# CONFIG_USB_OHCI_HCD is not set/g" .config

make olddefconfig
make -j4

cd -
cp $UBOOT_BUILD/u-boot-sunxi-with-spl.bin $DEST_DIR

