#!/bin/bash

# This scripts only can be used in postconfig2.sh
# or you can opkg update and install bash before run it

echo "Install common packages"
opkg install vim
opkg install git
opkg install openssh-client
opkg install usbutils
opkg install kmod-fs-vfat
opkg install kmod-fs-ext4
opkg install shadow-useradd shadow-usermod shadow-userdel shadow-passwd shadow-newgrp

echo "Mount point configure"
uci batch < ./mount.uci 
block umount && block mount


echo "pptp support"
opkg install ppp-mod-pptp kmod-nf-nathelper-extra luci-proto-ppp kmod-ipt-raw
uci batch < ./pptp.uci
echo "iptables -t raw -A OUTPUT -p tcp -m tcp --dport 1723 -j CT --helper pptp" >> /etc/firewall.user

echo "static ip and host name"

uci batch < ./add.uci

echo "WLAN setttings"

uci batch < ./wlan.uci

echo "Config SAMBA"
opkg list | grep -e "samba.*-server" | cut -f 1 -d ' ' | xargs opkg install
uci batch < ./samba.uci 
echo "Now you can configure the samba server web"
echo "Dont forget add permision to shared folder"




