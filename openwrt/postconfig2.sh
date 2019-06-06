#!/bin/bash

# This scripts only can be used in postconfig2.sh
# or you can opkg update and install bash before run it

echo "Install common packages"
opkg install vim


echo "pptp support"
opkg install ppp-mod-pptp
opkg install luci-proto-ppp

echo "static ip and host name"

uci batch < ./add.uci
