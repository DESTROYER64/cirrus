#!/bin/bash

cd /tmp

# Compress function with zstd 

ccache_upload () 
{
	echo $(date +"%d-%m-%Y %T")
	time tar "-I zstd -1 -T2" -cf $1.tar.zst $1
	rclone copy --drive-chunk-size 256M --stats 1s $1.tar.zst cirrus:ccache/ci2 -P
}

mkdir -p ~/.config/rclone
echo "$DRIVE" > ~/.config/rclone/rclone.conf

ccache_upload ccache
