#!/bin/bash

# This scripts only can be used in postconfig2.sh
# or you can opkg update and install bash before run it

echo "Install common packages"
opkg install vim


echo "Add pptp support"
opkg install ppp-mod-pptp
opkg install luci-proto-ppp

echo "Add host names"

