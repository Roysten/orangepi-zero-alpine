#!/bin/sh

SRC_DIR=src
BUILD_DIR=build
DEST_DIR=bin

UBOOT="ftp://ftp.denx.de/pub/u-boot/u-boot-2019.07.tar.bz2"
LINUX="https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.2.4.tar.xz"
ALPINE="http://dl-cdn.alpinelinux.org/alpine/v3.10/releases/armv7/alpine-uboot-3.10.1-armv7.tar.gz"

UBOOT_SRC=$SRC_DIR/$(basename $UBOOT)
LINUX_SRC=$SRC_DIR/$(basename $LINUX)
ALPINE_SRC=$SRC_DIR/$(basename $ALPINE)

UBOOT_BUILD=$BUILD_DIR/uboot
LINUX_BUILD=$BUILD_DIR/linux
ALPINE_BUILD=$BUILD_DIR/alpine

TOOLCHAIN=/mnt/data/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin
