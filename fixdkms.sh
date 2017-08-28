#!/bin/bash

dkms remove -m zfs -v 0.7.1 --all
dkms add -m zfs -v 0.7.1
dkms install -m zfs -v 0.7.1
modprobe zfs
