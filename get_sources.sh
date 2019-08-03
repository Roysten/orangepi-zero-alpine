#!/bin/sh

source ./env.sh

if [ ! -f $UBOOT_SRC ]; then
	curl $UBOOT --output $UBOOT_SRC
fi

if [ ! -f $LINUX_SRC ]; then
	curl $LINUX --output $LINUX_SRC
fi

if [ ! -f $ALPINE_SRC ]; then
	curl $ALPINE --output $ALPINE_SRC
fi
