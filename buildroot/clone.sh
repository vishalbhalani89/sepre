sudo umount /mnt/img
sudo mount /dev/sdb1 /mnt/img
sudo cp -rf /home/vishal/buildroot/output/images/u-boot.bin /mnt/img/kernel.img
sudo cp -rf /home/vishal/buildroot/output/images/zImage /mnt/img/
sudo cp -rf /home/vishal/buildroot/output/images/bcm2710-rpi-3-b.dtb /mnt/img/
sudo cp -rf /home/vishal/buildroot/output/images/boot.scr /mnt/img/
sudo cp -rf /home/vishal/buildroot/output/images/rpi-firmware/* /mnt/img/
sync
sudo umount /mnt/img
sudo mount /dev/sdb2 /mnt/img
sudo rm -rf /mnt/img/*
sudo tar -xvf /home/vishal/buildroot/output/images/rootfs.tar -C /mnt/img/
sync
sudo umount /mnt/img
exit 0
