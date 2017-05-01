#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

cp -rf /home/vishal/buildroot/board/raspberrypi/post_build/interfaces ${TARGET_DIR}/etc/network/
rm -rf ${TARGET_DIR}/etc/resolv.conf
cp -rf /home/vishal/buildroot/board/raspberrypi/post_build/resolv.conf ${TARGET_DIR}/etc/resolv.conf
cp -rf /home/vishal/buildroot/board/raspberrypi/post_build/sshd_config ${TARGET_DIR}/etc/ssh/
cp -rf /home/vishal/buildroot/board/raspberrypi/post_build/wpa_supplicant.conf ${TARGET_DIR}/etc/
cp -rf /home/vishal/buildroot/board/raspberrypi/post_build/S100sepre ${TARGET_DIR}/etc/init.d/
cp -rf /home/vishal/buildroot/board/raspberrypi/post_build/dhcpd.conf ${TARGET_DIR}/etc/
cat /home/vishal/buildroot/board/raspberrypi/post_build/environment >> ${TARGET_DIR}/etc/profile

