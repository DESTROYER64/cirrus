#!/bin/bash

ccache_download () 
{
	mkdir -p ~/.config/rclone
	echo "$DRIVE" > ~/.config/rclone/rclone.conf
	rclone copy cirrus:ccache/ci2/ccache.tar.zst /tmp -P
	tar -xaf ccache.tar.zst
	rm -rf ccache.tar.zst
}
 
cd /tmp
ccache_download
echo "CCACHE IS CONFIGURED"