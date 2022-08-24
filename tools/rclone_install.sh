#!/usr/bin/env bash
set -e
tmp_dir=$(mktemp -d 2>/dev/null || mktemp -d -t 'rclone-install.XXXXXXXXXX')
cd "$tmp_dir"
set -e
#curl -OfsS https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip -a $1/tools/rclone-current-linux-amd64.zip -d tmp_unzip_dir_for_rclone
cd tmp_unzip_dir_for_rclone/*
cp rclone /usr/bin/rclone.new
chmod 755 /usr/bin/rclone.new
chown root:root /usr/bin/rclone.new
mv /usr/bin/rclone.new /usr/bin/rclone
mkdir -p /usr/local/share/man/man1
cp rclone.1 /usr/local/share/man/man1/
mandb
printf "\nrclone v1.59.1 has successfully installed."
exit 0