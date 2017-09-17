#!/bin/bash
if [ "$#" -ne 1 ]; then
  echo "Usage: clone.sh <device>"
  exit 1
fi

if [ ! -b $1 ]; then
  echo $1 device not exist
  exit 1
fi

sudo umount /mnt/img
sudo mount $11 /mnt/img
sudo cp -rf /home/vishal/buildroot/output/images/MLO /mnt/img/
sudo cp -rf /home/vishal/buildroot/output/images/u-boot.img /mnt/img/
sudo cp -rf /home/vishal/buildroot/output/images/zImage /mnt/img/
sudo cp -rf /home/vishal/buildroot/output/images/*.dtb /mnt/img/
sudo cp -rf /home/vishal/buildroot/output/images/uEnv.txt /mnt/img/
sync
sudo umount /mnt/img
sudo mount $12 /mnt/img
sudo rm -rf /mnt/img/*
sudo tar -xvf /home/vishal/buildroot/output/images/rootfs.tar -C /mnt/img/
sync
sudo umount /mnt/img
sudo eject $1
exit 0
