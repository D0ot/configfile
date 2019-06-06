#!/bin/bash

# This scripts only can be used in postconfig2.sh
# or you can opkg update and install bash before run it

echo "Install common packages"
opkg install vim
opkg install git
opkg install openssh-client

echo "pptp support"
opkg install ppp-mod-pptp kmod-nf-nathelper-extra luci-proto-ppp kmod-ipt-raw

echo "static ip and host name"

uci batch < ./add.uci

echo "WLAN setttings"

uci batch < .wlan.uci
