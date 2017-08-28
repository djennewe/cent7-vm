#!/bin/bash

wget http://download.zfsonlinux.org/epel/zfs-release.el7_3.noarch.rpm
gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux
rpm -ivh zfs-release.el7_3.noarch.rpm
yum install -y zfs kernel-devel

/sbin/modprobe zfs
systemctl enable zfs-import-cache zfs-import-scan zfs-mount zfs-share zfs-zed zfs.target
zpool status

