#!/bin/ash

SOURCE_FILE="/etc/opkg/distfeeds.conf"

cp ${SOURCE_FILE} ${SOURCE_FILE}.http
sed 's/\(https\|http\)/https/g' ${SOURCE_FILE}.http > ${SOURCE_FILE}
