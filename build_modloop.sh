#!/bin/sh

source ./env.sh

TMP=$(mktemp -d)
mkdir $TMP/root

cleanup() {
	echo "Remove $TMP"
	rm -rf $TMP
}

trap cleanup EXIT

cp $ALPINE_BUILD/boot/modloop-vanilla $TMP

(cd $TMP/root && unsquashfs ../modloop-vanilla)

rm -r $TMP/root/squashfs-root/modules/*-vanilla
cp -r $LINUX_BUILD/out/modules/lib/modules/* $TMP/root/squashfs-root/modules/

rm -r $TMP/root/squashfs-root/modules/firmware/*
mkdir -p $TMP/root/squashfs-root/modules/firmware/ath9k_htc
cp -r ath9k_htc/*.fw $TMP/root/squashfs-root/modules/firmware/ath9k_htc

(cd $TMP/root && mksquashfs squashfs-root/ modloop-new -b 1048576 -comp xz -Xdict-size 100%)

cp $TMP/root/modloop-new $DEST_DIR/modloop

