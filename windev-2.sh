#!/bin/sh
# source: https://www.youtube.com/watch?v=fyclA-_M-aA

VMDIR=${HOME}/.kvm/win10-2
WINIMG=${HOME}/.kvm/win10/Win10_1803_English_x64.iso

qemu-system-x86_64 --enable-kvm \
  -smp 4 \
  -m 6G \
  -net nic \
  -net user,hostname=windowsvm \
  -vga vmware \
  -drive id=disk,file=${VMDIR}/win10.img,if=none \
  -device ahci,id=ahci \
  -device ide-drive,drive=disk,bus=ahci.0 \
  -device usb-ehci,id=ehci \
  -device usb-tablet,bus=ehci.0

# only need this for first boot (os installation)
# -cdrom ${WINIMG} \

