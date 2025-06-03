#!/bin/sh

find $1/.. -name 'ubuntu-rootfs.7z' -exec mv "{}" $1/  \;

7z x ubuntu-rootfs.7z

mkdir rootdir
mount -o loop rootfs.img rootdir

mkdir -p rootdir/data/local/tmp
mount --bind /dev rootdir/dev
mount --bind /dev/pts rootdir/dev/pts
mount --bind /proc rootdir/proc
mount -t tmpfs tmpfs rootdir/data/local/tmp
mount --bind /sys rootdir/sys

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:\$PATH
export DEBIAN_FRONTEND=noninteractive

find $1/.. -name 'alsa-oneplus-sm8550.deb' -exec cp "{}" $1/rootdir/  \;
find $1/.. -name 'firmware-oneplus-*.deb' -exec cp "{}" $1/rootdir/  \;
find $1/.. -name 'linux-oneplus-sm8550.deb' -exec cp "{}" $1/rootdir/  \;
chroot rootdir dpkg -i alsa-oneplus-sm8550.deb
chroot rootdir dpkg -i firmware-oneplus-a$2.deb
chroot rootdir dpkg -i linux-oneplus-sm8550.deb
rm -rf $1/rootdir/*.deb

umount rootdir/sys
umount rootdir/proc
umount rootdir/dev/pts
umount rootdir/data/local/tmp
umount rootdir/dev
umount rootdir

rm -d rootdir

7z a ubuntu-rootfs.7z rootfs.img
