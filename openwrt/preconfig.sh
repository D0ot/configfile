#!/bin/ash

echo "Config OpenWrt before ExtRoot"

chmod +x ./chsrc.sh ./opkgssl.sh ./swichssl.sh ./extroot.sh 

echo "Change source to mirrors of tsinghua"
./chsrc.sh

echo "Add SSL support for opkg"
./opkgssl.sh

echo "Switch opkp source, http to https"
./swichssl.sh 

echo "ExtRoot..."
./extroot.sh 

echo "Config Done"
