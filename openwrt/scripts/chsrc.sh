#!/bin/ash

sed 's/\(https:\/\/\|http:\/\/\)\(.*\)\<releases\>\(.*\)/\1mirrors.tuna.tsinghua.edu.cn\/lede\/releases\3/g' /etc/opkg/distfeeds.conf
