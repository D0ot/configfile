#!/bin/ash

echo "Post configure start..."

echo "Get bash"

opkg update 
opkg install bash

echo "Run postconfig2.sh"

./postconfig2.sh

echo "Post postconfig End"
