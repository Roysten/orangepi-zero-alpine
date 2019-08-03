setenv machid 1029
setenv bootargs earlyprintk /boot/vmlinuz modloop=/boot/modloop console=${console}

setenv fdtaddr 0x43000000
setenv fdtovaddr 0x43c00000

load mmc 0:1 ${fdtaddr} boot/dtbs/sun8i-h2-plus-orangepi-zero.dtb
load mmc 0:1 ${fdtovaddr} boot/dtbs/sun8i-h3-analog-codec.dtbo
load mmc 0:1 0x41000000 boot/vmlinuz
load mmc 0:1 0x45000000 boot/initramfs-sunxi-new

fdt addr ${fdtaddr}

# Resize to create some extra space for the overlay
fdt resize 8192

fdt apply ${fdtovaddr}

bootz 0x41000000 0x45000000 ${fdtaddr}

