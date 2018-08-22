#!/bin/sh
# source https://www.funtoo.org/Windows_10_Virtualization_with_KVM

set -x

VMDIR=${HOME}/.kvm/win10
WINIMG=${VMDIR}/Win10_1803_English_x64.iso
VIRTIMG=${VMDIR}/virtio-win-drivers-20120712-1.iso

qemu-system-x86_64 --enable-kvm \
  -m 6G \
  -smp cores=4,threads=8 \
  -net nic,model=virtio \
  -net user \
  -vga vmware \
  -drive driver=raw,file=${VMDIR}/win10.img,if=virtio \
  -drive file=${VIRTIMG},index=3,media=cdrom \
  -rtc base=localtime,clock=host \
  -usb \
  -device usb-tablet \
  -cpu host  \
  -net user,smb=$HOME

# only need this for first boot (os installation)
# -cdrom ${WINIMG} \

