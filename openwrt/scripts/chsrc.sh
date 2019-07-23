#!/bin/ash

SOURCE_FILE="/etc/opkg/distfeeds.conf"

cp ${SOURCE_FILE} ${SOURCE_FILE}.old

sed 's/\(https:\/\/\|http:\/\/\)\(.*\)\<releases\>\(.*\)/\1mirrors.tuna.tsinghua.edu.cn\/lede\/releases\3/g' ${SOURCE_FILE}.old > ${SOURCE_FILE}
