#!/bin/sh

source ./env.sh

cd $LINUX_BUILD
export PATH=$PATH:/$TOOLCHAIN
export DTC_FLAGS=-@

# Configure build
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- sunxi_defconfig
sed -i "s/# CONFIG_SQUASHFS is not set/CONFIG_SQUASHFS=y/g" .config
sed -i "s/# CONFIG_BLK_DEV_LOOP is not set/CONFIG_BLK_DEV_LOOP=y/g" .config
sed -i "s/# CONFIG_WLAN is not set/CONFIG_WLAN=y/g" .config
echo "CONFIG_CFG80211=y" >> .config
echo "CONFIG_CFG80211_WEXT=y" >> .config
echo "CONFIG_MAC80211=y" >> .config
echo "CONFIG_ATH9K_HTC=m" >> .config
sed -i "s/# CONFIG_SND_SUN8I_CODEC is not set/CONFIG_SND_SUN8I_CODEC=y/g" .config
sed -i "s/# CONFIG_SND_SUN8I_CODEC_ANALOG is not set/CONFIG_SND_SUN8I_CODEC_ANALOG=y/g" .config

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- olddefconfig

sed -i "s/# CONFIG_SQUASHFS_XZ is not set/CONFIG_SQUASHFS_XZ=y/g" .config

# Start building
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make -j4 zImage dtbs
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=out/modules make modules modules_install

cd -

# Copy output
cp $LINUX_BUILD/arch/arm/boot/zImage $DEST_DIR
cp $LINUX_BUILD/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dtb $DEST_DIR

