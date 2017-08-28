#!/bin/bash

echo "Put this in /etc/zfs/vdev_id.conf"
echo
echo "multipath               no"
echo "topology                sas_direct"

s=0
for i in {a..e}; do 
	echo -n "alias slot_${s} "
	udevadm info --query=property /dev/sd${i} | grep DEVLINKS | cut -d' ' -f2; 
	s=$((s+1))
done

echo
echo "Then run udevadm trigger"
