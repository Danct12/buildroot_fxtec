# Buildroot for F(x)tec devices

## Build instructions
```
mkdir buildroot_fxtec && cd buildroot_fxtec
git clone https://github.com/buildroot/buildroot
git checkout 2024.05.1
git clone https://github.com/Danct12/buildroot_fxtec
cd buildroot
make BR2_EXTERNAL=$(pwd)/../buildroot_fxtec qx1050_defconfig
make
```

## Flashing
```
fastboot --set-active=a
fastboot flash boot_a output/images/boot.img
fastboot flash userdata output/images/rootfs.f2fs
fastboot reboot
```

## License
See COPYING file in the root of this repository.
