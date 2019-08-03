#!/bin/sh

source ./env.sh

mkdir -p $UBOOT_BUILD
mkdir -p $LINUX_BUILD
mkdir -p $ALPINE_BUILD

# Cleanup old
rm -rf $UBOOT_BUILD/*

# Extract sources
tar -xf $UBOOT_SRC -C $UBOOT_BUILD --strip-components=1

# Cleanup old
rm -rf $LINUX_BUILD/*

# Extract sources
tar -xf $LINUX_SRC -C $LINUX_BUILD --strip-components=1

# Cleanup old
rm -rf $ALPINE_BUILD/*

# Extract sources
tar -xf $ALPINE_SRC -C $ALPINE_BUILD --strip-components=1

