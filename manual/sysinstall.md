# Install to disk

```
setup-alpine
lbu_commit -d

mkdir /stage
mount /dev/mmcblk0p2 /stage
setup-disk -o /media/mmcblk0p1/MYHOSTNAME.apkovl.tar.gz /stage
# (ignore errors about syslinux/extlinux)

echo "extraargs=root=/media/mmcblk0p2" > /media/mmcblk0p1/boot/uEnv.txt

```

# Create /boot/uEnv.txt
```
extraargs=root=/dev/mmcblk0p2 quiet
```

# Setup mpv
```
apk add mpv-libs alsa-utils alsa-utils-doc alsa-lib alsaconf
```
