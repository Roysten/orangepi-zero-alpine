#!/bin/sh

source ./env.sh

BIN=sun8i-h3-analog-codec.dtbo

dtc -O dtb -o $BIN sun8i-h3-analog-codec.dts
cp $BIN $DEST_DIR

