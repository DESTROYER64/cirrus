#!/bin/bash

mkdir -p /tmp/rom # Where to sync source
cd /tmp/rom

##some of my work
git config --global user.name "D34DPUL"
git config --global user.email "metamovies69@gmail.com"

# Repo init command, that -device,-mips,-darwin,-notdefault part will save you more time and storage to sync, add more according to your rom and choice. Optimization is welcomed! Let's make it quit, and with depth=1 so that no unnecessary things.
repo init -q --no-repo-verify --depth=1 -u https://github.com/Project-Awaken/android_manifest -b 12.1 -g default,-mips,-darwin,-notdefault

# Local manifest
git clone https://github.com/D34DPUL/local_manifest_awaken.git --depth 1 -b main .repo/local_manifests

# Sync source with -q, no need unnecessary messages, you can remove -q if want! try with -j30 first, if fails, it will try again with -j8
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j 30 || repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j 8
