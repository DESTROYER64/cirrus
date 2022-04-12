#!/bin/bash

cd /tmp

# Compress function with pigz for faster compression
com () 
{ 
    tar --use-compress-program="pigz -k -$2 " -cf $1.tar.gz $1
}

time com ccache 1 # Compression level 1, its enough

mkdir -p ~/.config/rclone
echo "$DRIVE" > ~/.config/rclone/rclone.conf
time rclone copy ccache.tar.gz cirrus:ccache/ci2 -P
