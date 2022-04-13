#!/bin/bash

cd /tmp

# Compress function with pigz for faster compression
com () 
{ 
    echo $(date +"%d-%m-%Y %T")
    time tar "-I zstd -1 -T2" -cf $1.tar.zst $1
}

time com ccache 1 # Compression level 1, its enough

mkdir -p ~/.config/rclone
echo "$DRIVE" > ~/.config/rclone/rclone.conf
time rclone copy --drive-chunk-size 256M --stats 1s $1.tar.zst cirrus:ccache/ci2 -P
