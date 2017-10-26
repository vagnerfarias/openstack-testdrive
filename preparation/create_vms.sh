#!/bin/bash
#

VMPATH="/var/lib/libvirt/images"
INSTALL_SOURCE="/tmp/rhel-server-7.4-x86_64-dvd.iso"
KS_PATH="."
KS_NAME="testdrive-director-ks.cfg"

DIRECTOR_VM="testdrive-director"

# OpenStack Director VM
sudo virt-install --memory=16384 --vcpus=4 --os-type=linux --os-variant=rhel7 \
	--disk path=${VMPATH}/${DIRECTOR_VM}.qcow2,device=disk,size=60,bus=virtio,format=qcow2 \
	--noautoconsole --graphics=spice \
	--network mac='52:54:00:2e:60:cd',network=testdrive,portgroup=vlan-1001 \
	--network mac='52:54:00:72:10:0b',network=testdrive,portgroup=vlan-all \
	--location=${INSTALL_SOURCE} \
	--name ${DIRECTOR_VM} \
	--initrd-inject=${KS_PATH}/${KS_NAME} --extra-args "ks=file:/${KS_NAME}"


