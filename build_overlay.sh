#!/bin/sh

source ./env.sh

DIR=dt_overlay
BIN=sun8i-h3-analog-codec.dtbo

dtc -O dtb -o $DIR/$BIN $DIR/sun8i-h3-analog-codec.dts
cp $DIR/$BIN $DEST_DIR

