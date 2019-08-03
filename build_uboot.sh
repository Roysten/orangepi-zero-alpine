#!/bin/sh

source ./env.sh

cd $UBOOT_BUILD
export PATH=$PATH:/$TOOLCHAIN

make CROSS_COMPILE=arm-linux-gnueabihf- orangepi_zero_defconfig

sed -i "s/CONFIG_BOOTDELAY=2/CONFIG_BOOTDELAY=1/g" .config
sed -i "s/CONFIG_USB_EHCI_HCD=y/# CONFIG_USB_EHCI_HCD is not set/g" .config
sed -i "s/CONFIG_USB_OHCI_HCD=y/# CONFIG_USB_OHCI_HCD is not set/g" .config

make CROSS_COMPILE=arm-linux-gnueabihf- olddefconfig
make CROSS_COMPILE=arm-linux-gnueabihf-

cd -
cp $UBOOT_BUILD/u-boot-sunxi-with-spl.bin $DEST_DIR

