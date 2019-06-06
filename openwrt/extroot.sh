#!/bin/ash

echo "Get need packages"

opkg update
opkg install block-mount kmod-fs-ext4 kmod-usb-storage e2fsprogs kmod-usb-ohci kmod-usb-uhci fdisk

echo "Mount rootfs_data in another directory"

DEVICE="$(awk -e '/\s\/overlay\s/{print $1}' /etc/mtab)"
uci -q delete fstab.rwm
uci set fstab.rwm="mount"
uci set fstab.rwm.device="${DEVICE}"
uci set fstab.rwm.target="/rwm"
uci commit fstab

echo "Configure /dev/sda1 as new overlay via fstab uci subsystem"

DEVICE="/dev/sda1"
eval $(block info "${DEVICE}" | grep -o -e "UUID=\S*")
uci -q delete fstab.overlay
uci set fstab.overlay="mount"
uci set fstab.overlay.uuid="${UUID}"
uci set fstab.overlay.target="/overlay"
uci commit fstab

echo "Transferring Data"

mount /dev/sda1 /mnt/sda1
cp -a -f /overlay/. /mnt/sda1
umount /mnt/sda1


echo "You should check the work done by scripts and reboot, enjoy"

